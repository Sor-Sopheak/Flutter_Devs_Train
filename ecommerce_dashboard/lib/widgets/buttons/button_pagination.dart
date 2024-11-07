import 'package:flutter/material.dart';

typedef LoadPageFunction<T> = Future<List<T>> Function(int page);

class ButtonPagination<T> extends StatefulWidget {
  final LoadPageFunction<T> loadPage;
  final int itemsPerPage;
  final Widget Function(T) itemBuilder; // Item builder for each item type T

  const ButtonPagination({
    Key? key,
    required this.loadPage,
    required this.itemsPerPage,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  _ButtonPaginationState<T> createState() => _ButtonPaginationState<T>();
}

class _ButtonPaginationState<T> extends State<ButtonPagination<T>> {
  List<T> _items = [];
  bool _isLoading = false;
  bool _hasNextPage = true;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchPage(_currentPage);
  }

  Future<void> _fetchPage(int page) async {
    if (_isLoading) return;

    setState(() => _isLoading = true);
    List<T> newItems = await widget.loadPage(page);

    setState(() {
      _isLoading = false;
      _currentPage = page;
      _items = newItems;
      _hasNextPage = newItems.length == widget.itemsPerPage;
    });
  }

  void _loadNextPage() {
    if (_hasNextPage) _fetchPage(_currentPage + 1);
  }

  void _loadPreviousPage() {
    if (_currentPage > 1) _fetchPage(_currentPage - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) => widget.itemBuilder(_items[index]),
          ),
        ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed:
                  _currentPage > 1 && !_isLoading ? _loadPreviousPage : null,
              child: const Text("Previous"),
            ),
            ElevatedButton(
              onPressed: _hasNextPage && !_isLoading ? _loadNextPage : null,
              child: const Text("Next"),
            ),
          ],
        ),
      ],
    );
  }
}
