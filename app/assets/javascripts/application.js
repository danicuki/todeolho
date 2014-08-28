//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require select2
//= require select2_locale_pt-BR
//= require_tree .
//

$(function() {
  $("#searchPolitician").select2({
    placeholder: "Busque por um politico",
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
      if(p.image)  return "<div class='img-mask'> <img src='" + p.image  + "'/></div><span class='name'>"+ p.nickname+"</span>";
      return p.name;
    },
    minimumInputLength: 3,
    dropdownCssClass: "bigdrop",
    escapeMarkup: function (m) { return m; }
  }).on("change", function(e){
    window.location = "/politicians/"+e.added.uri;
  });

  $('.js__politicians-tab ul a').click(function(e) {
    $('.active').removeClass();
    $(this).closest('li').addClass('active');
    $('#infos-section, #notifications-section').toggle();
    e.preventDefault();
  });
});
