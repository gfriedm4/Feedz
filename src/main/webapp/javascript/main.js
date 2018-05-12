$(function() {
  $("form[name='login']").validate({
    // Specify validation rules
    rules: {
      email: {
        required: true,
        email: true
      },
      password: {
        required: true,
        minlength: 4
      }
    },
    // Specify validation error messages
    messages: {
      password: {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
      email: "Please enter a valid email address"
    },
    submitHandler: function(form) {
      form.submit();
    }
  });
  
  $("form[name='register']").validate({
	  rules: {
		email: {
			required: true,
			email: true,
		},
		password: {
			required: true,
			minlength: 4,
		},
		confirmPassword: {
			required: true,
			equalTo: "#password",
		},
		firstName: {
			required: true,
		},
		lastName: {
			required: true,
		},
	  },
	  messages: {
		  email: {
			  required: "Please provide an email address",
			  email: "Please provide a valid email address",
		  },
		  password: {
			  required: "Please provide a password",
			  minlength: "Password must be at least 4 characters",
		  },
		  confirmPassword:{
			  required: "Please provide a password",
			  equalTo: "Passwords do not match",
		  },
		  firstName: {
			required: "Please provide a First Name",  
		  },
		  lastName: {
			required: "Please provide a Last Name",  
		  },
	  },
  });
  
  $("form[name='updateProfile']").validate({
	  rules: {
		email: {
			required: true,
			email: true,
		},
		firstName: {
			required: true,
		},
		lastName: {
			required: true,
		},
	  },
	  messages: {
		  email: {
			  required: "Please provide an email address",
			  email: "Please provide a valid email address",
		  },
		  firstName: {
			required: "Please provide a First Name",  
		  },
		  lastName: {
			required: "Please provide a Last Name",  
		  },
	  },
  });
  
  $("form[name='updatePassword']").validate({
	  rules: {
		oldPassword: {
			required: true,
			minlength: 4,
		},
		newPassword: {
			required: true,
			minlength: 4,
		},
		confirmNewPassword: {
			equalTo: "#newPassword",
		},
	  },
	  messages: {
		  oldPassword: {
			  required: "Please provide a password",
			  minlength: "Password must be at least 4 characters",
		  },
		  newPassword:{
			  required: "Please provide a password",
			  minlength: "New password must be at least 4 characters",
		  },
		  confirmNewPassword: {
			  equalTo: "New Passwords do not match",
		  },
	  },
  });
  
  $("form[name='newFeed']").validate({
	  rules: {
		feedUrl: {
			required: true,
			url: true,
		},
	  },
	  messages: {
		feedUrl: {
			required: "Please provide a Url",
			url: "Please provide a valid Url"
		},  
	  },
  });
});