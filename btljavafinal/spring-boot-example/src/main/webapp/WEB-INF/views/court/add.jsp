<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
  <head>
    <title>Add Court</title>
  </head>
  <body>
    <h2>Add Court</h2>
    <form:form action="add" modelAttribute="court" method="post">
      <form:label path="name">Court Name:</form:label>
      <form:input path="name" />
      <form:errors path="" cssClass="error" />
      name
      <form:label path="address">Address:</form:label>
      <form:input path="address" />
      <form:errors path="address" cssClass="error" />

      <form:label path="owner.id">Owner Id</form:label>
      <form:input path="owner.id" />
      <form:errors path="owner.id" cssClass="error" />

      <!-- Add image and schedule fields here -->

      <button type="submit">Add Court</button>
    </form:form>
  </body>
</html>
