let yahl_first_sha = null;
let locked = false;
setInterval(async function () {
  if(locked) {
    return ;
  }
  locked = true
  let sha = await fetch("/get_folder_sha");
  sha = await sha.text();
  if (yahl_first_sha === null) {
    yahl_first_sha = sha;
    locked = false;
    return;
  }
  if (sha !== yahl_first_sha) {
    window.location.reload();
  }
  locked = false;
}, YAHL_DELAY);
