//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require select2
//= require_tree .
//
$(document).ready(function(){
  $(function() {
    $("#searchPolitician").select2({
      placeholder: "Busque por um politico",
      minimumInputLength: 1,
      ajax: {
        url: "/politicians.json",
        dataType: 'json',
        data: function (term, page) {
          return {
            q: term,
            limit: 10
          };
        },
        results: function (data, page) {
          return {results: data};
        }
      },
      formatResult: function(p){
        if(p.image)  return "<div class='img-mask'> <img src='" + p.image  + "'/></div><span class='name'>"+ p.name+"</span>";
        return p.name;
      },
      dropdownCssClass: "bigdrop",
      escapeMarkup: function (m) { return m; }
    }).on("change", function(e){
      window.location = "/politicians/"+e.val
    });
  });

});
