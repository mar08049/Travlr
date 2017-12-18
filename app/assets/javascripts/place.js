$(function(){
  $("a.load_comments").on("click", function(e){
    $.get(this.href).success(function(json){
      var $ul = $("div.comments ul")
      $ul.html("")
      debugger
      json.forEach(function(comment){

      })
    })
    e.preventDefault();
  })
})
$(function(){
  $("#new_comment").on("submit", function(e){
    alert("You clicked submit!!")
    url = this.action
    console.log(url)

    data =

    e.preventDefault();
  })
});
//For requirement #5.
//Create an object
class Comment{
  constructor(name, description, place_id) {
    this.name = name;
    this.description= description;
    this.place_id = place_id;
  }
}

Comment.prototype.makeComment = function() {
  console.log(`${this.name}-${this.description}`);
}
