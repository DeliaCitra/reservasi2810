<?php
require 'lib/db.php';

$userId = $_GET['user_id'];
$roomId = $_GET['room_id'];
$bundlingId = $_GET['bundling_id'];
$number_of_people = $_GET['number_of_people'];
$checkIn = $_GET['check_in'];
$checkOut = $_GET['check_out'];
$bookingId = $_GET['booking_id'];
$conn = $GLOBALS['conn'];


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice</title>
    <link rel="stylesheet" href="invoice.css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <!-- <?php require('inc/links.php'); ?> -->
</head>

<body>
    <div id="invoice" class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="invoice-title">
                    <h2>Invoice</h2>
                    <?php
                    echo "<h3 class='pull-right'>Order #ID $bookingId</h3>";
                    ?>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xs-6">
                        <address>
                            <strong>Data Pemesan:</strong>
                            <?php
                            $sql = "SELECT * FROM user WHERE id = $userId";
                            $res = mysqli_query($conn, $sql);
                            $user = mysqli_fetch_assoc($res);
                            echo "<br>{$user['name']}<br>";
                            echo "{$user['address']}<br>";
                            echo "{$user['phone']}<br>";
                            // echo "{$user['email']}<br>";
                            ?>
                            <br>
                        </address>
                    </div>
                    <div class="col-xs-6 text-right">
                        <address>
                            <strong>Tanggal Order :</strong>
                            <?php
                            $now = date('d M Y');
                            echo "<br>$now<br>";
                            ?>
                        </address>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Rincian Pesanan</strong></h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <td><strong>Item</strong></td>
                                        <td class="text-center"><strong>Check-In</strong></td>
                                        <td class="text-center"><strong>Check-Out</strong></td>
                                        <td class="text-center"><strong>Harga</strong></td>
                                        <?php
                                        if ($roomId != null) {
                                            echo "<td class='text-center'><strong>Hari</strong></td>";
                                        } else {
                                            echo "<td class='text-center'><strong>Hari</strong></td>";
                                            echo "<td class='text-center'><strong>Jumlah Orang</strong></td>";
                                        }
                                        ?>
                                        <td class="text-center"><strong>Total</strong></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <?php
                                        // echo json_encode($bundlingId);
                                        if ($roomId != null) {
                                            $sql = "SELECT * FROM room WHERE id = $roomId";
                                            $res = mysqli_query($conn, $sql);
                                            $room = mysqli_fetch_assoc($res);
                                            $totalDays = (strtotime($checkOut) - strtotime($checkIn)) / (60 * 60 * 24);
                                            $totalPrice = $totalDays * $room['price'];
                                            echo "<td>{$room['name']}</td>";
                                            echo "<td class='text-center'>" . date('d-m-Y', strtotime($checkIn)) . "</td>";
                                            echo "<td class='text-center'>" . date('d-m-Y', strtotime($checkOut)) . "</td>";
                                            echo "<td class='text-center'>{$room['price']}</td>";
                                            echo "<td class='text-center'>$totalDays</td>";
                                            echo "<td class='text-right'>$totalPrice</td>";
                                        } else {
                                            $sql = "SELECT * FROM bundling WHERE id = $bundlingId";
                                            $res = mysqli_query($conn, $sql);
                                            $bundling = mysqli_fetch_assoc($res);
                                            $totalDays = (strtotime($checkOut) - strtotime($checkIn)) / (60 * 60 * 24);
                                            $totalPrice = $totalDays * $bundling['price'];
                                            echo "<td>{$bundling['name']}</td>";
                                            echo "<td class='text-center'>" . date('d-m-Y', strtotime($checkIn)) . "</td>";
                                            echo "<td class='text-center'>" . date('d-m-Y', strtotime($checkOut)) . "</td>";
                                            echo "<td class='text-center'>{$bundling['price']}</td>";
                                            echo "<td class='text-center'>$totalDays</td>";
                                            echo "<td class='text-center'>$number_of_people</td>";
                                            echo "<td class='text-right'>$totalPrice</td>";
                                        }
                                        ?>
                                    </tr>
                                    <tr>
                                        <td class="text-center"></td>
                                        <td class="text-center"></td>
                                        <td class="text-center"></td>
                                        <td class="text-center"><strong>Keterangan</strong></td>
                                        <td class="text-right">Sudah Terbayar</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="text-danger bg-danger">
                            <b>*Pastikan anda menyimpan bukti invoice ini</b>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-4">
            <button id="printChrome" class="btn btn-primary">Print</button>
            <!-- save pdf using savePdf function -->
            <a href="invoiceSavePdf.php?booking_id=<?php echo $bookingId; ?>&user_id=<?php echo $userId; ?>&room_id=<?php echo $roomId; ?>&check_in=<?php echo $checkIn; ?>&check_out=<?php echo $checkOut; ?>&bundling_id=<?php echo $bundlingId; ?>&number_of_people=<?php echo $number_of_people; ?>"
                id="savePdf" class="btn btn-primary">Download</a>

        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.8.0/html2pdf.js"
        integrity="sha512-liPvfWpzKp7bXBAK05m+Uqrv5ATN4kCeUh64IygMoo98oEcTELOrymzU8omW2mEZszHHJ+qPOSkEzJLs2QqwQg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        document.getElementById('printChrome').addEventListener('click', function () {
            this.style.display = 'none';
            document.getElementById('savePdf').style.display = 'none';
            window.print();
            this.style.display = 'block';
            document.getElementById('savePdf').style.display = 'block';

        });
        document.getElementById('savePdf').addEventListener('click', function () {
            console.log('save pdf');
            var element = document.getElementById('invoice');
            var opt = {
                margin: 1,
                filename: 'Invoice_<?php echo $bookingId; ?>.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
            };

            // Create the PDF
            html2pdf().from(element).set(opt).save();
        });


    </script>
</body>

</html>