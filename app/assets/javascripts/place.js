$(function() {
  $("a.load_comments").on("click", function(e) {
    $.ajax({
      method: "GET",
      url: this.href
    }).done(fuction(data) {
      console.log(data)
    });

    e.preventDefault();
  })
})
//Not hijacking link. previous rendition of function did.
