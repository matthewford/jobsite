$('#job-search').live('ajax:success', function(event, xhr, status) {
  console.log(xhr);
  //TODO update the jobs table with a mustache template
})
