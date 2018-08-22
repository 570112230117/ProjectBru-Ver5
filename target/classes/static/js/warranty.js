//check_warranty
function check() {
	$('#alert').empty();
	$('#purchase').empty();
	$('#productcode').empty();
	$('#productname').empty();
	$('#serial').empty();
	$('#warranty').empty();
	$('#serialnumber').ready(function () {
		var testBean = { "vvv": $('#serialnumber').val() };
		$.ajax({
			type: "POST",
			url: "/warranty",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(testBean),
			dataType: "json",
			success: function (msg) {
				if (msg.serialNumber != null) {					
					$('#purchase').append('<p class="alert alert-info"><strong>วันที่ซื้อ (Date) ปี-เดือน-วัน</strong> : ' + msg.date + '</p>');
					$('#productcode').append('<p class="alert alert-info"><strong>รหัสสินค้า (Product Code)</strong> : ' + msg.productCode + '</p>');
					$('#productname').append('<p class="alert alert-info"><strong>ชื่อสินค้า (Product Name)</strong> : ' + msg.productName + '</p>');
					$('#serial').append('<p class="alert alert-info"><strong>Serial Number (S/N)</strong> : ' + msg.serialNumber + '</p>');
					$('#warranty').append('<p class="alert alert-info"><strong>ระยะเวลาประกัน</strong> : ' + msg.warranty + '</p>');
				}
				else if (msg.serialNumber == null) {
					$('#alert').append('<center>ไม่มีข้อมูล</center>');
				}
			}
		});
	});
}
