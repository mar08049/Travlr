$(function(){
  $("a.load_comments").on("click", function(e){
    $.get(this.href).success(function(json){
      var $ol = $("div.comments ol")
      $ol.html("")
      json.forEach(function(comment){
        debugger
      })
    })
    e.preventDefault();
  })
})


//For requirement #5.
//Create an object
function Comment(name, description) {
  this.name = name;
  this.description= description;
}

Comment.prototype.makeComment = function() {
  console.log(`${this.name}-${this.description}`);
}
