-- DROP TABLE "Bill";

CREATE TABLE "Bill" (
  "id_bill" int not null,
  "id_payment_method" int not null,
  "billed_at" datetime not null,
  "price" decimal not null,
  "payment_confirmed" boolean not null,
  PRIMARY KEY ("id_bill"),
  FOREIGN KEY ("id_payment_method") REFERENCES PaymentMethod("id_payment_method")
);

CREATE TABLE "User" (
  "id_user" int not null,
  "id_role" int not null,
  "id_grade_level" int,
  "id_contact" int not null,
  "first_name" text not null,
  "last_name" text not null,
  "date_of_birth" datetime,
  PRIMARY KEY ("id_user"),
  FOREIGN KEY ("id_role") REFERENCES Role("id_role"),
  FOREIGN KEY ("id_grade_level") REFERENCES GradeLevel("id_grade_level"),
  FOREIGN KEY ("id_contact") REFERENCES Contact("id_contact")
);

CREATE TABLE "RatingDispute" (
  "id_rating_dispute" int not null,
  "id_rating" int not null,
  "id_author" int not null,
  "reason" text not null,
  "is_reviewed" boolean not null,
  PRIMARY KEY ("id_rating_dispute"),
  FOREIGN KEY ("id_rating") REFERENCES Rating("id_rating"),
  FOREIGN KEY ("id_author") REFERENCES User("id_user")
);

CREATE TABLE "TutoringParticipant_WorkingMethod" (
  "id_tutoring_participant_working_method" int not null,
  "id_tutoring_participant" int not null,
  "id_working_method" int not null,
  "completed" boolean not null,
  PRIMARY KEY ("id_tutoring_participant_working_method"),
  FOREIGN KEY ("id_tutoring_participant") REFERENCES TutoringParticipant("id_tutoring_participant"),
  FOREIGN KEY ("id_working_method") REFERENCES WorkingMethod("id_working_method")
);

CREATE TABLE "Role" (
  "id_role" int not null,
  "code" text not null,
  "name" text not null,
  PRIMARY KEY ("id_role")
);

CREATE TABLE "TimeslotHideRule" (
  "id_timeslot_hide_rule" int not null,
  "total_income_threshold" decimal,
  "taken_slots_ratio_threshold" decimal,
  PRIMARY KEY ("id_timeslot_hide_rule")
);

CREATE TABLE "Subject" (
  "id_subject" int not null,
  "name" text not null,
  PRIMARY KEY ("id_subject")
);

CREATE TABLE "SchoolType" (
  "id_school_type" int not null,
  "name" text not null,
  PRIMARY KEY ("id_school_type")
);

CREATE TABLE "Medium" (
  "id_medium" int not null,
  "name" text not null,
  "description" text,
  "is_remote" boolean,
  PRIMARY KEY ("id_medium")
);

CREATE TABLE "PaymentMethod" (
  "id_payment_method" int not null,
  "name" text not null,
  PRIMARY KEY ("id_payment_method")
);

CREATE TABLE "TutoringParticipant" (
  "id_tutoring_participant" int not null,
  "id_user" int not null,
  PRIMARY KEY ("id_tutoring_participant"),
  FOREIGN KEY ("id_user") REFERENCES User("id_user")
);

CREATE TABLE "DiscountRule" (
    "id_discount_rule" int not null,
    "code" text not null,
    "name" text not null,
  PRIMARY KEY ("id_discount_rule")
);

CREATE TABLE "Timeslot" (
  "id_timeslot" int not null,
  "id_tutoring" int not null,
  "id_medium" int not null,
  "takes_place_at" datetime not null,
  "allow_multiple_participants" boolean not null,
  PRIMARY KEY ("id_timeslot"),
  FOREIGN KEY ("id_tutoring") REFERENCES Tutoring("id_tutoring"),
  FOREIGN KEY ("id_medium") REFERENCES Medium("id_medium")
);

CREATE TABLE "Rating" (
  "id_rating" int not null,
  "id_tutoring" int not null,
  "rate" int not null,
  "comment" text,
  PRIMARY KEY ("id_rating"),
  FOREIGN KEY ("id_tutoring") REFERENCES Tutoring("id_tutoring")
);

CREATE TABLE "Description" (
  "id_description" int not null,
  "banner_url" text,
  "description" text,
  PRIMARY KEY ("id_description")
);

CREATE TABLE "GradeLevel" (
  "id_grade_level" int not null,
  "id_school_type" int not null,
  "grade_number" int not null,
  PRIMARY KEY ("id_grade_level"),
  FOREIGN KEY ("id_school_type") REFERENCES SchoolType("id_school_type")
);

CREATE TABLE "Contact" (
  "id_contact" int not null,
  "email" text,
  "phone_number" text,
  "parent_email" text,
  "parent_phone_number" text,
  "description" text,
  PRIMARY KEY ("id_contact")
);

CREATE TABLE "TutoringScope" (
  "id_tutoring_scope" int not null,
  "name" text not null,
  PRIMARY KEY ("id_tutoring_scope")
);

CREATE TABLE "Book" (
  "id_book" int not null,
  "name" text not null,
  "author" text,
  PRIMARY KEY ("id_book")
);

CREATE TABLE "SpecialNeed" (
  "id_special_need" int not null,
  "name" text not null,
  PRIMARY KEY ("id_special_need")
);

CREATE TABLE "Discount" (
  "id_discount" int not null,
  "id_tutoring" int not null,
  "id_discount_rule" int not null,
  "new_price_multiplier" decimal not null,
  "due_date" datetime,
  "consumed_count" int not null,
  "max_consumed_count" int,
  PRIMARY KEY ("id_discount"),
  FOREIGN KEY ("id_tutoring") REFERENCES Tutoring("id_tutoring"),
  FOREIGN KEY ("id_discount_rule") REFERENCES DiscountRule("id_discount_rule")
);

CREATE TABLE "WorkingMethod" (
  "id_working_method" int not null,
  "description" text not null,
  PRIMARY KEY ("id_working_method")
);

CREATE TABLE "Timeslot_TutoringParticipant" (
  "id_timeslot_tutoring_participant" int not null,
  "id_timeslot" int not null,
  "id_tutoring_participant" int not null,
  "id_bill" int not null,
  PRIMARY KEY ("id_timeslot_tutoring_participant"),
  FOREIGN KEY ("id_timeslot") REFERENCES Timeslot("id_timeslot"),
  FOREIGN KEY ("id_tutoring_participant") REFERENCES TutoringParticipant("id_tutoring_participant"),
  FOREIGN KEY ("id_bill") REFERENCES Bill("id_bill")
);

CREATE TABLE "User_SpecialNeed" (
  "id_user_special_need" int not null,
  "id_user" int not null,
  "id_special_need" int not null,
  PRIMARY KEY ("id_user_special_need"),
  FOREIGN KEY ("id_user") REFERENCES User("id_user"),
  FOREIGN KEY ("id_special_need") REFERENCES SpecialNeed("id_special_need")
);

CREATE TABLE "Cancellation" (
  "id_cancellation" int not null,
  "id_timeslot_tutoring_participant" int not null,
  "approved" boolean not null,
  PRIMARY KEY ("id_cancellation"),
  FOREIGN KEY ("id_timeslot_tutoring_participant") REFERENCES Timeslot_TutoringParticipant("id_timeslot_tutoring_participant")
);

CREATE TABLE "Attribute" (
  "id_attribute" int not null,
  "id_author" int not null,
  "name" text not null,
  PRIMARY KEY ("id_attribute"),
  FOREIGN KEY ("id_author") REFERENCES User("id_user")
);

CREATE TABLE "TeachingNote" (
  "id_teaching_note" int not null,
  "id_author" int not null,
  "id_tutoring_participant" int not null,
  "note" text not null,
  PRIMARY KEY ("id_teaching_note"),
  FOREIGN KEY ("id_author") REFERENCES User("id_user"),
  FOREIGN KEY ("id_tutoring_participant") REFERENCES TutoringParticipant("id_tutoring_participant")
);

CREATE TABLE "Tutoring" (
  "id_tutoring" int not null,
  "id_teacher" int not null,
  "id_tutoring_scope" int not null,
  "id_subject" int not null,
  "id_book" int,
  "id_description" int not null,
  "id_timeslot_hide_rule" int not null,
  "name" text not null,
  "allow_gaps" boolean not null,
  "timeslot_mins" int not null,
  "price_for_timeslot" int not null,
  PRIMARY KEY ("id_tutoring"),
  FOREIGN KEY ("id_teacher") REFERENCES User("id_user"),
  FOREIGN KEY ("id_tutoring_scope") REFERENCES TutoringScope("id_tutoring_scope"),
  FOREIGN KEY ("id_subject") REFERENCES Subject("id_subject"),
  FOREIGN KEY ("id_book") REFERENCES Book("id_book"),
  FOREIGN KEY ("id_description") REFERENCES Description("id_description"),
  FOREIGN KEY ("id_timeslot_hide_rule") REFERENCES TimeslotHideRule("id_timeslot_hide_rule")
);

CREATE TABLE "TutoringParticipant_Attribute" (
  "id_tutoring_participant_attribute" int not null,
  "id_tutoring_participant" int not null,
  "id_attribute" int not null,
  "value" text not null,
  PRIMARY KEY ("id_tutoring_participant_attribute"),
  FOREIGN KEY ("id_tutoring_participant") REFERENCES TutoringParticipant("id_tutoring_participant"),
  FOREIGN KEY ("id_attribute") REFERENCES Attribute("id_attribute")
);

CREATE TABLE "AvailableHours" (
  "id_available_hours" int not null,
  "id_tutoring" int not null,
  "weekday" int not null,
  "start_hour" time not null,
  "end_hour" time not null,
  PRIMARY KEY ("id_available_hours"),
  FOREIGN KEY ("id_tutoring") REFERENCES Tutoring("id_tutoring")
);