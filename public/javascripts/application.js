$('#job-search').live('ajax:success', function(event, xhr, status) {
  template = Handlebars.compile($("#listings-template").html(););
  $("ul#jobs").html(template({listings: xhr}));
})
