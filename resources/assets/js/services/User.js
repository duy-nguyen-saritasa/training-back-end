import userResource from '../resource/User';

export default {
  get() {
    return userResource.get();
  },
  loadList() {
    return userResource.list();
  },
  create(user) {
    return userResource.create(user);
  },
  update(user) {
    return userResource.update(user);
  },
  delete(id) {
    return userResource.delete(id);
  },
};
