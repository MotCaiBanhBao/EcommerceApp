const isAuthenticated = (roles) => (req, res, next) => {
    // `roles` argument is an array of roles
    // We check whether user authenticated or not.
    // If user authenticated, `req.user` will be object otherwise it will be `undefined` 
    if(req.user) { // `req.user` is a user object from Database
      // Checking whether `req.user` has a corresponded role
      if (roles.indexOf(req.user.role) !== -1) next(); // `req.user.role` is string and it may be "admin", "superadmin", or "user"
      else res.status(403).send({message: "unauthorized"}); 
    } else {
      res.status(401).send({message: "unauthorized"});
    }
  };
  

module.exports = isAuthenticated;