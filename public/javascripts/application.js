$('form#job-search').live('ajax:success', function(event, xhr, status) {
  template = Handlebars.compile($("#listings-template").html());
  $("ul#jobs").html(template({listings: xhr}));
  console.log(xhr);
});

$('form#job-search select').live('change', function(){
  $('form#job-search').submit();
});
