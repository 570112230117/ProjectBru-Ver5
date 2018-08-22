//radio
// var warranty = "";
// $(document).ready(function() {
// 	$("#warranty").change(function() {
// 		warranty = "นอกประกัน";
// 	});
// 	$("#warranty1").change(function() {
// 		warranty = "ในประกัน";
// 	});
// });

//insert
                    function insertConfirm() {
                        var repairBean = {
                            repairDateStr: $('#repairDate').val(),
                            repairname: $('#name').val(),
                            repairAddress: $('#address').val(),
                            repairPhone: $('#phone').val(),
                            repairEmail: $('#email').val(),
                            repairAppliances: $('#appliances').val(),
                            repairProduct: $('#product').val(),
                            repairBrand: $('#brand').val(),
                            repairWaste: $('#Waste').val(),
                            repairDetail: $('#detail').val(),
                            repairAppointment: $('#appointment').val(),


                        }

                        $.ajax({
                            type: "POST",
                            url: "/insertRepair",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(repairBean),
                            dataType: "json",
                            success: function(msg) {
                                console.log(msg)
                                window.location.href = msg.page;
                            },
                            error: function() {
                                window.location.href = "/";

                            }
                        });

                    }