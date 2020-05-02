jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

function uncheckAll(){
    $('input[type="checkbox"]:checked').prop('checked',false);
}

function updateCheckboxes(x) {
    let searchBar = $('#SearchBar')
    if (searchBar.val() === '') {
        $('.form-control-checkboxes > label').show();
    } else {
        $('.form-control-checkboxes > label').hide();
        $('.form-control-checkboxes > label:contains('+searchBar.val()+')').show();
    }
}
