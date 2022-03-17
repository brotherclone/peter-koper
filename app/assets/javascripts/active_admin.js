//= require active_admin/base
//= require activeadmin/quill_editor/quill
//= require activeadmin/quill_editor_input
//= require tinymce


$(document).ready(function() {
    tinymce.init({
        selector: 'textarea',
        height: 600
    })
});

