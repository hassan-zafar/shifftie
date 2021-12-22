import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

typedef FirestoreAnimatedListItemBuilder = Widget Function(
  BuildContext context,
  DocumentSnapshot snapshot,
  Animation<double> animation,
  int index,
);

/// An AnimatedList widget that is bound to a query
class FirestoreAnimatedList extends StatefulWidget {
  /// Creates a scrolling container that animates items when they are inserted or removed.
  const FirestoreAnimatedList({
    Key? key,
    required this.query,
    required this.itemBuilder,
    this.defaultChild,
    this.scrollDirection = Axis.vertical,
    this.reverse = true,
    required this.controller,
    this.primary = false,
    required this.physics,
    this.shrinkWrap = false,
    this.padding = EdgeInsets.zero,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  /// A Firebase query to use to populate the animated list
  final Query query;

  /// A widget to display while the query is loading. Defaults to an empty
  /// Container().
  final Widget? defaultChild;

  /// Called, as needed, to build list item widgets.
  ///
  /// List items are only built when they're scrolled into view.
  ///
  /// The [DataSnapshot] parameter indicates the snapshot that should be used
  /// to build the item.
  ///
  /// Implementations of this callback should assume that [AnimatedList.removeItem]
  /// removes an item immediately.
  final FirestoreAnimatedListItemBuilder itemBuilder;

  /// The axis along which the scroll view scrolls.
  ///
  /// Defaults to [Axis.vertical].
  final Axis scrollDirection;

  /// Whether the scroll view scrolls in the reading direction.
  ///
  /// For example, if the reading direction is left-to-right and
  /// [scrollDirection] is [Axis.horizontal], then the scroll view scrolls from
  /// left to right when [reverse] is false and from right to left when
  /// [reverse] is true.
  ///
  /// Similarly, if [scrollDirection] is [Axis.vertical], then the scroll view
  /// scrolls from top to bottom when [reverse] is false and from bottom to top
  /// when [reverse] is true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// An object that can be used to control the position to which this scroll
  /// view is scrolled.
  ///
  /// Must be null if [primary] is true.
  final ScrollController? controller;

  /// Whether this is the primary scroll view associated with the parent
  /// [PrimaryScrollController].
  ///
  /// On iOS, this identifies the scroll view that will scroll to top in
  /// response to a tap in the status bar.
  ///
  /// Defaults to true when [scrollDirection] is [Axis.vertical] and
  /// [controller] is null.
  final bool primary;

  /// How the scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to animate after the
  /// user stops dragging the scroll view.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics physics;

  /// Whether the extent of the scroll view in the [scrollDirection] should be
  /// determined by the contents being viewed.
  ///
  /// If the scroll view does not shrink wrap, then the scroll view will expand
  /// to the maximum allowed size in the [scrollDirection]. If the scroll view
  /// has unbounded constraints in the [scrollDirection], then [shrinkWrap] must
  /// be true.
  ///
  /// Shrink wrapping the content of the scroll view is significantly more
  /// expensive than expanding to the maximum allowed size because the content
  /// can expand and contract during scrolling, which means the size of the
  /// scroll view needs to be recomputed whenever the scroll position changes.
  ///
  /// Defaults to false.
  final bool shrinkWrap;

  /// The amount of space by which to inset the children.
  final EdgeInsets padding;

  /// The duration of the insert and remove animation.
  ///
  /// Defaults to const Duration(milliseconds: 300).
  final Duration duration;

  @override
  FirebaseAnimatedListState createState() => FirebaseAnimatedListState();
}

class FirebaseAnimatedListState extends State<FirestoreAnimatedList> {
  final _animatedListKey = GlobalKey<AnimatedListState>();
  FirestoreList? _list;

  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  @override
  void didUpdateWidget(FirestoreAnimatedList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query != oldWidget.query) {
      _subscribe();
    }
  }

  void _subscribe() {
    _list?.dispose();
    _list = FirestoreList(
      query: widget.query,
      onInitialData: _onInitialData,
      onChildAdded: _onChildAdded,
      onChildChanged: _onChildChanged,
      onChildRemoved: _onChildRemoved,
      onError: _onError,
    );
    _list?.listen();
  }

  void _onInitialData() {
    setState(() {});
  }

  void _onChildAdded(int index, DocumentSnapshot snapshot) {
    _animatedListKey.currentState?.insertItem(index, duration: widget.duration);
  }

  void _onChildChanged(int index, DocumentSnapshot snapshot) {
    setState(() {});
  }

  void _onChildRemoved(int index, DocumentSnapshot snapshot) {
    _animatedListKey.currentState?.removeItem(
      index,
      (BuildContext context, Animation<double> animation) {
        return widget.itemBuilder(context, snapshot, animation, index);
      },
      duration: widget.duration,
    );
  }

  void _onError(dynamic error, StackTrace trace) {
    printLog('$error\n$trace');
  }

  @override
  void dispose() {
    _list?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_list!.isLoaded) {
      return widget.defaultChild ?? Container();
    }
    return AnimatedList(
      key: _animatedListKey,
      itemBuilder: _buildItem,
      initialItemCount: _list!.length,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      controller: widget.controller,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
    );
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return widget.itemBuilder(context, _list![index], animation, index);
  }
}

typedef FirestoreListOnInit = void Function();
typedef FirestoreListOnChild = void Function(
    int index, DocumentSnapshot change);
typedef FirestoreListOnError = void Function(dynamic error, StackTrace trace);

class FirestoreList extends ListBase<DocumentSnapshot> {
  FirestoreList({
    @required this.query,
    this.onInitialData,
    this.onChildAdded,
    this.onChildRemoved,
    this.onChildChanged,
    this.onError,
  });

  final Query? query;

  final FirestoreListOnInit? onInitialData;
  final FirestoreListOnChild? onChildAdded;
  final FirestoreListOnChild? onChildRemoved;
  final FirestoreListOnChild? onChildChanged;
  final FirestoreListOnError? onError;

  final List<DocumentSnapshot> _snapshots = <DocumentSnapshot>[];

  late StreamSubscription<QuerySnapshot> _sub;
  bool _loaded = false;

  void listen() {
    _loaded = false;
    _sub = query!.snapshots().listen(_onData, onError: _onError);
  }

  void dispose() {
    _sub.cancel();
  }

  void _onData(QuerySnapshot snapshot) {
    if (_loaded == false) {
      if (_snapshots.length == snapshot.docs.length) {
        _snapshots.setAll(0, snapshot.docs);
      } else {
        _snapshots.clear();
        _snapshots.addAll(snapshot.docs);
      }
      _loaded = true;
      onInitialData?.call();
      return;
    }

    for (final change in snapshot.docChanges) {
      switch (change.type) {
        case DocumentChangeType.added:
          _snapshots.insert(change.newIndex, change.doc);
          onChildAdded?.call(change.newIndex, change.doc);
          break;
        case DocumentChangeType.modified:
          //print('modified ${change.oldIndex} ${change.newIndex}');
          if (change.oldIndex == change.newIndex) {
            _snapshots.removeAt(change.oldIndex);
            _snapshots.insert(change.newIndex, change.doc);
            onChildChanged?.call(change.newIndex, change.doc);
          } else {
            final oldDoc = _snapshots.removeAt(change.oldIndex);
            onChildRemoved!.call(change.oldIndex, oldDoc);
            _snapshots.insert(change.newIndex, change.doc);
            onChildAdded?.call(change.newIndex, change.doc);
          }
          break;
        case DocumentChangeType.removed:
          _snapshots.removeAt(change.oldIndex);
          onChildRemoved!.call(change.oldIndex, change.doc);
          break;
      }
    }
  }

  void _onError(error, StackTrace stackTrace) {
    onError?.call(error, stackTrace);
  }

  bool get isLoaded => _loaded;

  // ---

  @override
  DocumentSnapshot operator [](int index) => _snapshots[index];

  @override
  void operator []=(int index, DocumentSnapshot value) {
    throw UnsupportedError('List cannot be modified.');
  }

  @override
  set length(int newLength) {
    throw UnsupportedError('List cannot be modified.');
  }

  @override
  int get length => _snapshots.length;
}
