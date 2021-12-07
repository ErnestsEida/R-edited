import Tagify from "@yaireo/tagify";

document.addEventListener("turbolinks:load", () => {
  var communityTags = document.querySelector('#community-tags'),
  communityTagify = new Tagify( communityTags );

  var postTags = document.querySelector('#post-tags'),
  postTagify = new Tagify( postTags );
});
