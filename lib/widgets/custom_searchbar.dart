import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final void Function(String)? onSearch;

  const SearchBar({Key? key, this.onSearch}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search products...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              if (widget.onSearch != null) {
                widget.onSearch!(_controller.text);
              }
            },
          ),
        ),
      ),
    );
  }
}
