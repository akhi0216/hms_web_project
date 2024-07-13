import 'package:flutter/material.dart';

class IpBilling extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<IpBilling> {
  final List<List<TextEditingController>> _firstTableControllers =
      List.generate(
    4,
    (i) => List.generate(4, (j) => TextEditingController()),
  );

  final List<List<TextEditingController?>> _secondTableControllers =
      List.generate(
    4,
    (i) => List.generate(4, (j) => j != 1 ? TextEditingController() : null),
  );

  final List<List<TextEditingController?>> _thirdTableControllers =
      List.generate(
    4,
    (i) => List.generate(4, (j) => j != 1 ? TextEditingController() : null),
  );

  final List<List<TextEditingController>> _fourthTableControllers =
      List.generate(
    3,
    (i) => List.generate(6, (j) => TextEditingController()),
  );

  final List<List<TextEditingController>> _fifthTableControllers =
      List.generate(
    4,
    (i) => List.generate(1, (j) => TextEditingController()),
  );

  final List<List<TextEditingController>> _sixthTableControllers =
      List.generate(
    4,
    (i) => List.generate(8, (j) => TextEditingController()),
  );

  final List<List<TextEditingController>> _seventhTableControllers =
      List.generate(
    4,
    (i) => List.generate(4, (j) => TextEditingController()),
  );

  final List<List<TextEditingController>> _eighthTableControllers =
      List.generate(
    4,
    (i) => List.generate(8, (j) => TextEditingController()),
  );

  final List<List<TextEditingController>> _ninthTableControllers =
      List.generate(
    4,
    (i) => List.generate(6, (j) => TextEditingController()),
  );

  final List<List<TextEditingController>> _tenthTableControllers =
      List.generate(
    4,
    (i) => List.generate(8, (j) => TextEditingController()),
  );

  final List<List<TextEditingController>> _eleventhTableControllers =
      List.generate(
    4,
    (i) => List.generate(6, (j) => TextEditingController()),
  );

  final TextEditingController _sixthTotalController = TextEditingController();
  final TextEditingController _seventhTotalController = TextEditingController();
  final TextEditingController _eighthTotalController = TextEditingController();
  final TextEditingController _ninthTotalController = TextEditingController();
  final TextEditingController _tenthTotalController = TextEditingController();
  final TextEditingController _eleventhTotalController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            _buildTitle('First Table'),
            _buildFirstTable(),
            SizedBox(height: 32),
            _buildTitle('Second Table'),
            _buildSecondTable(),
            _buildTitle('Third Table'),
            _buildThirdTable(),
            SizedBox(height: 32),
            _buildTitle('Fourth Table'),
            _buildFourthTable(),
            SizedBox(height: 32),
            _buildTitle('Fifth Table'),
            _buildFifthTable(),
            SizedBox(height: 32),
            _buildTitle('Sixth Table'),
            _buildSixthTable(),
            _buildTotalField(_sixthTotalController),
            SizedBox(height: 32),
            _buildTitle('Seventh Table'),
            _buildSeventhTable(),
            _buildTotalField(_seventhTotalController),
            SizedBox(height: 32),
            _buildTitle('Eighth Table'),
            _buildEighthTable(),
            _buildTotalField(_eighthTotalController),
            SizedBox(height: 32),
            _buildTitle('Ninth Table'),
            _buildNinthTable(),
            _buildTotalField(_ninthTotalController),
            SizedBox(height: 32),
            _buildTitle('Tenth Table'),
            _buildTenthTable(),
            _buildTotalField(_tenthTotalController),
            SizedBox(height: 32),
            _buildTitle('Eleventh Table'),
            _buildEleventhTable(),
            _buildTotalField(_eleventhTotalController),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  TableRow _buildFirstTableRow(int rowIndex) {
    return TableRow(
      children: [
        for (var colIndex = 0; colIndex < 4; colIndex++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstTableControllers[rowIndex][colIndex],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFirstTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(100),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(150),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('Date & Time'),
            _buildTableHeader('From'),
            _buildTableHeader('To'),
            _buildTableHeader('Name'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildFirstTableRow(i),
      ],
    );
  }

  TableRow _buildSecondTableRow(int rowIndex) {
    return TableRow(
      children: [
        _buildSecondTableCell(rowIndex, 0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('till', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        _buildSecondTableCell(rowIndex, 2),
        _buildSecondTableCell(rowIndex, 3),
      ],
    );
  }

  Widget _buildSecondTableCell(int rowIndex, int colIndex) {
    final controller = _secondTableControllers[rowIndex][colIndex];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: controller != null
          ? TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            )
          : Center(
              child: Text('till'),
            ),
    );
  }

  Widget _buildSecondTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(100),
        2: FixedColumnWidth(150),
        3: FixedColumnWidth(150),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('Date & Time'),
            _buildTableHeader(''),
            _buildTableHeader('Date & Time'),
            _buildTableHeader('Name'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildSecondTableRow(i),
      ],
    );
  }

  TableRow _buildThirdTableRow(int rowIndex) {
    return TableRow(
      children: [
        _buildThirdTableCell(rowIndex, 0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('till', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        _buildThirdTableCell(rowIndex, 2),
        _buildThirdTableCell(rowIndex, 3),
      ],
    );
  }

  Widget _buildThirdTableCell(int rowIndex, int colIndex) {
    final controller = _thirdTableControllers[rowIndex][colIndex];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: controller != null
          ? TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            )
          : Center(
              child: Text('till'),
            ),
    );
  }

  Widget _buildThirdTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(100),
        2: FixedColumnWidth(150),
        3: FixedColumnWidth(150),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('Date & Time'),
            _buildTableHeader(''),
            _buildTableHeader('Date & Time'),
            _buildTableHeader('Name'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildThirdTableRow(i),
      ],
    );
  }

  TableRow _buildFourthTableRow(int rowIndex) {
    return TableRow(
      children: [
        for (var colIndex = 0; colIndex < 6; colIndex++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _fourthTableControllers[rowIndex][colIndex],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFourthTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(100),
        2: FixedColumnWidth(150),
        3: FixedColumnWidth(150),
        4: FixedColumnWidth(150),
        5: FixedColumnWidth(150),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('DATE'),
            _buildTableHeader('BILL No.'),
            _buildTableHeader('NAME(OT STAFF)'),
            _buildTableHeader('DATE'),
            _buildTableHeader('BILL No.'),
            _buildTableHeader('NAME(OT STAFF)'),
          ],
        ),
        for (var i = 0; i < 3; i++) _buildFourthTableRow(i),
      ],
    );
  }

  TableRow _buildFifthTableRow(int rowIndex) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _fifthTableControllers[rowIndex][0],
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFifthTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FlexColumnWidth(),
      },
      children: [
        for (var i = 0; i < 4; i++) _buildFifthTableRow(i),
      ],
    );
  }

  TableRow _buildSixthTableRow(int rowIndex) {
    return TableRow(
      children: [
        for (var colIndex = 0; colIndex < 8; colIndex++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _sixthTableControllers[rowIndex][colIndex],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSixthTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(100),
        1: FixedColumnWidth(100),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(100),
        4: FixedColumnWidth(100),
        5: FixedColumnWidth(100),
        6: FixedColumnWidth(100),
        7: FixedColumnWidth(100),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildSixthTableRow(i),
      ],
    );
  }

  TableRow _buildSeventhTableRow(int rowIndex) {
    return TableRow(
      children: [
        for (var colIndex = 0; colIndex < 4; colIndex++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _seventhTableControllers[rowIndex][colIndex],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSeventhTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(150),
        2: FixedColumnWidth(150),
        3: FixedColumnWidth(150),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildSeventhTableRow(i),
      ],
    );
  }

  TableRow _buildEighthTableRow(int rowIndex) {
    return TableRow(
      children: [
        for (var colIndex = 0; colIndex < 8; colIndex++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _eighthTableControllers[rowIndex][colIndex],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEighthTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(100),
        1: FixedColumnWidth(100),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(100),
        4: FixedColumnWidth(100),
        5: FixedColumnWidth(100),
        6: FixedColumnWidth(100),
        7: FixedColumnWidth(100),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildEighthTableRow(i),
      ],
    );
  }

  TableRow _buildNinthTableRow(int rowIndex) {
    return TableRow(
      children: [
        for (var colIndex = 0; colIndex < 6; colIndex++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _ninthTableControllers[rowIndex][colIndex],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildNinthTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(150),
        2: FixedColumnWidth(150),
        3: FixedColumnWidth(150),
        4: FixedColumnWidth(150),
        5: FixedColumnWidth(150),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildNinthTableRow(i),
      ],
    );
  }

  TableRow _buildTenthTableRow(int rowIndex) {
    return TableRow(
      children: [
        for (var colIndex = 0; colIndex < 8; colIndex++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _tenthTableControllers[rowIndex][colIndex],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTenthTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(100),
        1: FixedColumnWidth(100),
        2: FixedColumnWidth(100),
        3: FixedColumnWidth(100),
        4: FixedColumnWidth(100),
        5: FixedColumnWidth(100),
        6: FixedColumnWidth(100),
        7: FixedColumnWidth(100),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
            _buildTableHeader('DATE'),
            _buildTableHeader('AMOUNT'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildTenthTableRow(i),
      ],
    );
  }

  TableRow _buildEleventhTableRow(int rowIndex) {
    return TableRow(
      children: [
        for (var colIndex = 0; colIndex < 6; colIndex++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _eleventhTableControllers[rowIndex][colIndex],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEleventhTable() {
    return Table(
      border: TableBorder.all(color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(150),
        1: FixedColumnWidth(150),
        2: FixedColumnWidth(150),
        3: FixedColumnWidth(150),
        4: FixedColumnWidth(150),
        5: FixedColumnWidth(150),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[300]),
          children: [
            _buildTableHeader('DATE'),
            _buildTableHeader('QUANTITY'),
            _buildTableHeader('DATE'),
            _buildTableHeader('QUANTITY'),
            _buildTableHeader('DATE'),
            _buildTableHeader('QUANTITY'),
          ],
        ),
        for (var i = 0; i < 4; i++) _buildEleventhTableRow(i),
      ],
    );
  }

  Widget _buildTotalField(TextEditingController controller) {
    return Container(
      constraints: BoxConstraints(maxWidth: 800),
      child: Row(
        children: [
          Text(
            'Total:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
