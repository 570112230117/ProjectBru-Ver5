 $(document).ready(function() {

     $.ajax({
         type: "GET",
         url: "/appliances",
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         success: function(msg) {
             for (var i = 0; i < msg.length; i++) {
                 $('#appliances').append('<option value="' + msg[i].appliancesId + '">' + msg[i].name + '</option>');
             }
         }
     });

     $('#appliances').change(function() {
         $('#product').empty();
         $('#brand').empty();
         $('#brand').append('<option value="">== กรุณาเลือก ==</option>');
         var testAjexBean = {
             "appliances": $('#appliances').val()
         };
         $.ajax({
             type: "POST",
             url: "/product",
             data: JSON.stringify(testAjexBean),
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function(msg) {
                 $('#product').append('<option value="">== กรุณาเลือก ==</option>');
                 for (var i = 0; i < msg.length; i++) {
                     $('#product').append('<option value="' + msg[i].productid + '">' + msg[i].product + '</option>');
                 }
             }
         });
     });

     $('#product').change(function() {
         $('#brand').empty();
         var testAjexBean = {
             "appliances": $('#appliances').val(),
             "brand": $('#product').val()
         };
         $.ajax({
             type: "POST",
             url: "/brand",
             data: JSON.stringify(testAjexBean),
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function(msg) {
                 $('#brand').append('<option value="">== กรุณาเลือก ==</option>');
                 for (var i = 0; i < msg.length; i++) {
                     $('#brand').append('<option value="' + msg[i].id + '">' + msg[i].name + '</option>');
                 }
             }
         });
     });

 });