<template>
    <!-- The Modal -->
    <div class="modal fade" id="registerModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <form autocomplete="off" @submit.prevent="register" method="post">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Register User</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div id="msg-login-error" class="alert alert-danger" v-if="errors">
                            <ul>
                                <li v-for="error in errors">{{ error.messages[0] }}</li>
                            </ul>
                        </div>

                        <div class="form-group">
                            <label for="first_name"><b>First name</b></label>
                            <input type="text" placeholder="First name" name="first_name" v-model="user.first_name"
                            >
                        </div>

                        <div class="form-group">
                            <label for="last_name"><b>Last name</b></label>
                            <input type="text" placeholder="First name" name="last_name" v-model="user.last_name"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="email"><b>Email</b></label>
                            <input type="text" placeholder="Last name" name="email" v-model="user.email"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="password"><b>Password</b></label>
                            <input type="password" placeholder="Enter Password" name="password"
                                   v-model="user.password" required>
                        </div>

                        <div class="form-group">
                            <button type="submit">Register</button>
                        </div>
                    </div>
                </form>

                <!-- Modal footer -->
                <div class="modal-footer">

                </div>

            </div>
        </div>
    </div>
</template>

<script>
  import userService from '../../../services/User';

  export default {
    data() {
      return {
        user: {},
        errors: null,
      };
    },
    methods: {
      register() {
        const app = this;
        userService.create(app.user).then(() => {
          // Hide register modal
          $('#registerModal').modal('hide');
          // Emit after registered success
          app.$emit('register', 'Registered successfully');
          // Clear form
          app.clearForm();
        }).catch((e) => {
          app.errors = e.response.data.errors || e.response.data.message;
        });
      },
      clearForm() {
        this.user = {};
        this.errors = null;
      },
    },
  };
</script>