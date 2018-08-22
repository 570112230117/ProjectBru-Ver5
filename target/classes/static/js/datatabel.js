$(document).ready(function () {
	var table = $('#employeesTable').DataTable({
		"sAjaxSource": "/all",
		"sAjaxDataProp": "",
		"order": [[0, "DESC"]],
		"aoColumns": [
			{
				"mData": "repairDateStr",
				"sWidth": "120px"
			},
			{ "mData": "repairname",
				"sWidth": "150px", },
			{
				"mData": "",
				"sWidth": "100px",
				"mRender": function (data, type, full) {
					if (full.repairWarranty == 'ในประกัน') {
						return '<center><span class="label label-success">' + full.repairWarranty + '</span></center>';
					} else {
						return '<center><span class="label label-danger">' + full.repairWarranty + '</span></center>';
					}

				}
			},
			{ "mData": "repairProduct",
				"sWidth": "100px", 
				},
			
			{ "mData": "repairWaste",
					"sWidth": "300px", 
					},
			{ "mData": "repairAppointment",
						"sWidth": "70px",
						},
			{
				"mData": "",
				"sWidth": "300px", 
				"mRender": function (data, type, full) {
					return '<a href=#>' + 'สาเหตุ / วิธีแก้' + '</a>';
				}
			},
			{
				"mData": "",
				"mRender": function (data, type, full) {
					return '<a href=#>' + 'ผู้รับแจ้ง' + '</a>';
				}
			}, 
			{
				"mData": "",
				"sWidth": "80px", 
				"mRender": function (data, type, full) {
					return '<a href=#>' + 'สถานะ' + '</a>';
				}
			},{
				"mData": "",
				"sWidth": "130px", 
				"mRender": function (data, type, full) {
					return '<a href=#>' + 'ช่าง A' + '</a>';
				}
			}, 
			{
				"mData": "",
				"sWidth": "100px", 
				"mRender": function (data, type, full) {
					return '<center><a href="/repairmen/' + full.repairId + '" ' + 'class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-edit"></span>' + '</a> <a href="/update/' + full.repairId + '" ' + 'class="btn btn-info btn-sm"><span class="glyphicon glyphicon-pencil"></span>' + '</a></center>';

				}
			},

		]
	})
});