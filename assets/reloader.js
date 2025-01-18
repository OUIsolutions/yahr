let yahl_first_sha = null;

setInterval(async function () {
  let sha = await fetch("/get_folder_sha");
  sha = await sha.text();
  if (yahl_first_sha === null) {
    yahl_first_sha = sha;
    return;
  }
  if (sha !== yahl_first_sha) {
    window.location.reload();
  }
}, YAHL_DELAY);
