import dragginz from 'ic:canisters/dragginz';

dragginz.greet(window.prompt("Enter your name:")).then(greeting => {
  window.alert(greeting);
});
