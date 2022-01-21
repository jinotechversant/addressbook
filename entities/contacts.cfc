component entityname="contacts" persistent="true" table="contacts" {

	property name="id" column="id" fieldtype="id" generator="increment";
    property name="Title" column="title" ormtype="text";
    property name="FirstName" column="first_name" ormtype="text";
    property name="LastName" column="last_name" ormtype="text";
    property name="Gender" column="gender" ormtype="text";
    property name="DateBirth" column="date_of_birth" ormtype="date";
    property name="PhotoName" column="photo_name" ormtype="text";
    property name="Address" column="address" ormtype="text";
    property name="Pincode" column="pincode" ormtype="text";
    property name="Email" column="email" ormtype="text";
    property name="Phone" column="phone" ormtype="text";
    property name="Userid" column="userid" ormtype="text";

}