<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Edit Court</title>
  </head>
  <body>
    <h2>Edit Court</h2>

    <form:form
      action="${pageContext.request.contextPath}/courts/edit/${court.id}"
      modelAttribute="court"
      method="post"
    >
      <!-- Court Name -->
      <div>
        <form:label path="name">Court Name:</form:label>
        <form:input path="name" />
        <form:errors path="name" cssClass="error" />
      </div>

      <!-- Court Address -->
      <div>
        <form:label path="address">Address:</form:label>
        <form:input path="address" />
        <form:errors path="address" cssClass="error" />
      </div>

      <!-- Owner's Name -->
      <div>
        <form:label path="owner.username">Owner's Name:</form:label>
        <form:input path="owner.username" />
        <form:errors path="owner.username" cssClass="error" />
      </div>

      <!-- Owner's Phone Number -->
      <div>
        <form:label path="owner.phoneNumber">Owner's Phone Number:</form:label>
        <form:input path="owner.phoneNumber" />
        <form:errors path="owner.phoneNumber" cssClass="error" />
      </div>

      <!-- Submit Button -->
      <div>
        <button type="submit">Save Changes</button>
        <a href="${pageContext.request.contextPath}/courts">Cancel</a>
      </div>
    </form:form>
  </body>
</html>
