// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function countTasks(status,id){
    if(document.getElementById("myTable")==null)
        return;
    var x = 0;
    var i;
    var tableSize = document.getElementById("myTable").rows.length;
    var dataTable = document.getElementById("myTable");
    for (i = 1; i < tableSize; i++) {
        if (dataTable.rows[i].cells[7].innerHTML == status) {
            x+=1;
        }
    }
    document.getElementById(id).innerHTML= "=> " + x ;
}
