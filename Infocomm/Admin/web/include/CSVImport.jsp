



<a href="#" class="export" style="color:#35b5d7;" title="Download">
    <span style="margin-top: 2px; " class="glyphicons glyphicons-download_alt"  >&nbsp;&nbsp;</span>
</a>

<script>


    

    $(document).ready(function () {

        function exportTableToCSV($table, filename) {

            var $rows = $table.find('tr:has(th)'),
                    tmpColDelim = String.fromCharCode(11), // vertical tab character
                    tmpRowDelim = String.fromCharCode(0), // null character
// actual delimiter characters for CSV format
                    colDelim = '","',
                    rowDelim = '"\r\n"',
// Grab text from table into CSV formatted string
                    csv1 = '"' + $rows.map(function (i, row)
                    {
                        var $row = $(row),
                                $cols = $row.find('th');
                        return $cols.map(function (j, col) {
                            var $col = $(col),
                                    text = $col.text();
                            return text.replace(/"/g, '""'); // escape double quotes

                        }).get().join(tmpColDelim);

                    }).get().join(tmpRowDelim)
                    .split(tmpRowDelim).join(rowDelim)
                    .split(tmpColDelim).join(colDelim);
// Data URI
            // csvData1 = encodeURIComponent(csv1);

            ///


            $rows = $table.find('tr:has(td)'),
                    tmpColDelim = String.fromCharCode(11), // vertical tab character
                    tmpRowDelim = String.fromCharCode(0), // null character
// actual delimiter characters for CSV format
                    colDelim = '","',
                    rowDelim = '"\r\n"',
// Grab text from table into CSV formatted string
                    csv = $rows.map(function (i, row)
                    {
                        var $row = $(row),
                                $cols = $row.find('td');
                        return $cols.map(function (j, col) {
                            var $col = $(col),
                                    text = $col.text();
                            return text.replace(/"/g, '""'); // escape double quotes

                        }).get().join(tmpColDelim);

                    }).get().join(tmpRowDelim)
                    .split(tmpRowDelim).join(rowDelim)
                    .split(tmpColDelim).join(colDelim) + '"',
// Data URI
                    csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csv1 + tmpColDelim + rowDelim + csv);

            $(this)
                    .attr({
                        'download': filename,
                        'href': csvData,
                        'target': '_blank'
                    });
        }
        $(".export").on('click', function (event) {
            var d = new Date();
            var curr_day = d.getDate();
            var curr_month = d.getMonth();
            var curr_year = d.getFullYear();
            var filename = curr_day + "_" + curr_month + "_" + curr_year;
            exportTableToCSV.apply(this, [$('#datatable'), 'Export_' + filename + '.csv']);

        });





    });

</script>