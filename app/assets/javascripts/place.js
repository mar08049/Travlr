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

//For requirement #5.
//Create an object
function Comment(name, description) {
  this.name = name;
  this.description= description;
}

Comment.prototype.makeComment = function() {
  console.log(`${this.name}-${this.description}`);
}
