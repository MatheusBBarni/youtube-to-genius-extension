export function set(key, value) {
  chrome.storage.sync.set({ [key]: value });
}

export function get(key, cb) {
  chrome.storage.sync.get([key], cb);
}