-- DROP TABLE "Bill";
-- todo
-- add index, default value, required
-- separate foreign keys from CREATE TABLE
-- add testdata inserts
-- add comments
-- todo add author fields

CREATE TABLE "Bill"
(
    "id_bill"           SERIAL   NOT NULL,
    "id_payment_method" SERIAL   NOT NULL,
    "billed_at"         DATETIME NOT NULL,
    "price"             DECIMAL  NOT NULL,
    "payment_confirmed" BOOLEAN  NOT NULL,
    PRIMARY KEY ("id_bill"),
    FOREIGN KEY ("id_payment_method") REFERENCES PaymentMethod("id_payment_method")
);

CREATE TABLE "User"
(
    "id_user"        SERIAL NOT NULL,
    "id_role"        SERIAL NOT NULL,
    "id_grade_level" SERIAL,
    "id_contact"     SERIAL NOT NULL,
    "first_name"     TEXT   NOT NULL,
    "last_name"      TEXT   NOT NULL,
    "date_of_birth"  DATETIME,
    PRIMARY KEY ("id_user"),
    FOREIGN KEY ("id_role") REFERENCES role ("id_role"),
    FOREIGN KEY ("id_grade_level") REFERENCES gradelevel ("id_grade_level"),
    FOREIGN KEY ("id_contact") REFERENCES contact ("id_contact")
);

CREATE TABLE "RatingDispute"
(
    "id_rating_dispute" SERIAL  NOT NULL,
    "id_rating"         SERIAL  NOT NULL,
    "id_author"         SERIAL  NOT NULL,
    "reason"            TEXT    NOT NULL,
    "is_reviewed"       BOOLEAN NOT NULL,
    PRIMARY KEY ("id_rating_dispute"),
    FOREIGN KEY ("id_rating") REFERENCES rating ("id_rating"),
    FOREIGN KEY ("id_author") REFERENCES user ("id_user")
);

CREATE TABLE "TutoringParticipant_WorkingMethod"
(
    "id_tutoring_participant_working_method" SERIAL  NOT NULL,
    "id_tutoring_participant"                SERIAL  NOT NULL,
    "id_working_method"                      SERIAL  NOT NULL,
    "completed"                              BOOLEAN NOT NULL,
    PRIMARY KEY ("id_tutoring_participant_working_method"),
    FOREIGN KEY ("id_tutoring_participant") REFERENCES tutoringparticipant ("id_tutoring_participant"),
    FOREIGN KEY ("id_working_method") REFERENCES workingmethod ("id_working_method")
);

CREATE TABLE "Role"
(
    "id_role" SERIAL NOT NULL,
    "code"    TEXT   NOT NULL,
    "name"    TEXT   NOT NULL,
    PRIMARY KEY ("id_role")
);

CREATE TABLE "TimeslotHideRule"
(
    "id_timeslot_hide_rule"       SERIAL NOT NULL,
    "total_income_threshold"      DECIMAL,
    "taken_slots_ratio_threshold" DECIMAL,
    PRIMARY KEY ("id_timeslot_hide_rule")
);

CREATE TABLE "Subject"
(
    "id_subject" SERIAL NOT NULL,
    "name"       TEXT   NOT NULL,
    PRIMARY KEY ("id_subject")
);

CREATE TABLE "SchoolType"
(
    "id_school_type" SERIAL NOT NULL,
    "name"           TEXT   NOT NULL,
    PRIMARY KEY ("id_school_type")
);

CREATE TABLE "Medium"
(
    "id_medium"   SERIAL NOT NULL,
    "name"        TEXT   NOT NULL,
    "description" TEXT,
    "is_remote"   BOOLEAN,
    PRIMARY KEY ("id_medium")
);

CREATE TABLE "PaymentMethod"
(
    "id_payment_method" SERIAL NOT NULL,
    "name"              TEXT   NOT NULL,
    PRIMARY KEY ("id_payment_method")
);

CREATE TABLE "TutoringParticipant"
(
    "id_tutoring_participant" SERIAL NOT NULL,
    "id_user"                 SERIAL NOT NULL,
    PRIMARY KEY ("id_tutoring_participant"),
    FOREIGN KEY ("id_user") REFERENCES user ("id_user")
);

CREATE TABLE "DiscountRule"
(
    "id_discount_rule" SERIAL NOT NULL,
    "code"             TEXT   NOT NULL,
    "name"             TEXT   NOT NULL,
    PRIMARY KEY ("id_discount_rule")
);

CREATE TABLE "Timeslot"
(
    "id_timeslot"                 SERIAL   NOT NULL,
    "id_tutoring"                 SERIAL   NOT NULL,
    "id_medium"                   SERIAL   NOT NULL,
    "takes_place_at"              DATETIME NOT NULL,
    "allow_multiple_participants" BOOLEAN  NOT NULL,
    PRIMARY KEY ("id_timeslot"),
    FOREIGN KEY ("id_tutoring") REFERENCES tutoring ("id_tutoring"),
    FOREIGN KEY ("id_medium") REFERENCES medium ("id_medium")
);

CREATE TABLE "Rating"
(
    "id_rating"   SERIAL NOT NULL,
    "id_tutoring" SERIAL NOT NULL,
    "rate"        INT    NOT NULL,
    "comment"     TEXT,
    PRIMARY KEY ("id_rating"),
    FOREIGN KEY ("id_tutoring") REFERENCES tutoring ("id_tutoring")
);

CREATE TABLE "Description"
(
    "id_description" SERIAL NOT NULL,
    "banner_url"     TEXT,
    "description"    TEXT,
    PRIMARY KEY ("id_description")
);

CREATE TABLE "GradeLevel"
(
    "id_grade_level" SERIAL NOT NULL,
    "id_school_type" SERIAL NOT NULL,
    "grade_number"   INT    NOT NULL,
    PRIMARY KEY ("id_grade_level"),
    FOREIGN KEY ("id_school_type") REFERENCES schooltype ("id_school_type")
);

CREATE TABLE "Contact"
(
    "id_contact"          SERIAL NOT NULL,
    "email"               TEXT,
    "phone_number"        TEXT,
    "parent_email"        TEXT,
    "parent_phone_number" TEXT,
    "description"         TEXT,
    PRIMARY KEY ("id_contact")
);

CREATE TABLE "TutoringScope"
(
    "id_tutoring_scope" SERIAL NOT NULL,
    "name"              TEXT   NOT NULL,
    PRIMARY KEY ("id_tutoring_scope")
);

CREATE TABLE "Book"
(
    "id_book" SERIAL NOT NULL,
    "name"    TEXT   NOT NULL,
    "author"  TEXT,
    PRIMARY KEY ("id_book")
);

CREATE TABLE "SpecialNeed"
(
    "id_special_need" SERIAL NOT NULL,
    "name"            TEXT   NOT NULL,
    PRIMARY KEY ("id_special_need")
);

CREATE TABLE "Discount"
(
    "id_discount"          SERIAL  NOT NULL,
    "id_tutoring"          SERIAL  NOT NULL,
    "id_discount_rule"     SERIAL  NOT NULL,
    "new_price_multiplier" DECIMAL NOT NULL,
    "due_date"             DATETIME,
    "consumed_count"       INT     NOT NULL,
    "max_consumed_count"   INT,
    PRIMARY KEY ("id_discount"),
    FOREIGN KEY ("id_tutoring") REFERENCES tutoring ("id_tutoring"),
    FOREIGN KEY ("id_discount_rule") REFERENCES discountrule ("id_discount_rule")
);

CREATE TABLE "WorkingMethod"
(
    "id_working_method" SERIAL NOT NULL,
    "description"       TEXT   NOT NULL,
    PRIMARY KEY ("id_working_method")
);

CREATE TABLE "Timeslot_TutoringParticipant"
(
    "id_timeslot_tutoring_participant" SERIAL NOT NULL,
    "id_timeslot"                      SERIAL NOT NULL,
    "id_tutoring_participant"          SERIAL NOT NULL,
    "id_bill"                          SERIAL NOT NULL,
    PRIMARY KEY ("id_timeslot_tutoring_participant"),
    FOREIGN KEY ("id_timeslot") REFERENCES timeslot ("id_timeslot"),
    FOREIGN KEY ("id_tutoring_participant") REFERENCES tutoringparticipant ("id_tutoring_participant"),
    FOREIGN KEY ("id_bill") REFERENCES bill ("id_bill")
);

CREATE TABLE "User_SpecialNeed"
(
    "id_user_special_need" SERIAL NOT NULL,
    "id_user"              SERIAL NOT NULL,
    "id_special_need"      SERIAL NOT NULL,
    PRIMARY KEY ("id_user_special_need"),
    FOREIGN KEY ("id_user") REFERENCES user ("id_user"),
    FOREIGN KEY ("id_special_need") REFERENCES specialneed ("id_special_need")
);

CREATE TABLE "Cancellation"
(
    "id_cancellation"                  SERIAL  NOT NULL,
    "id_timeslot_tutoring_participant" SERIAL  NOT NULL,
    "approved"                         BOOLEAN NOT NULL,
    PRIMARY KEY ("id_cancellation"),
    FOREIGN KEY ("id_timeslot_tutoring_participant") REFERENCES timeslot_tutoringparticipant ("id_timeslot_tutoring_participant")
);

CREATE TABLE "Attribute"
(
    "id_attribute" SERIAL NOT NULL,
    "id_author"    SERIAL NOT NULL,
    "name"         TEXT   NOT NULL,
    PRIMARY KEY ("id_attribute"),
    FOREIGN KEY ("id_author") REFERENCES user ("id_user")
);

CREATE TABLE "TeachingNote"
(
    "id_teaching_note"        SERIAL NOT NULL,
    "id_author"               SERIAL NOT NULL,
    "id_tutoring_participant" SERIAL NOT NULL,
    "note"                    TEXT   NOT NULL,
    PRIMARY KEY ("id_teaching_note"),
    FOREIGN KEY ("id_author") REFERENCES user ("id_user"),
    FOREIGN KEY ("id_tutoring_participant") REFERENCES tutoringparticipant ("id_tutoring_participant")
);

CREATE TABLE "Tutoring"
(
    "id_tutoring"           SERIAL  NOT NULL,
    "id_teacher"            SERIAL  NOT NULL,
    "id_tutoring_scope"     SERIAL  NOT NULL,
    "id_subject"            SERIAL  NOT NULL,
    "id_book"               SERIAL,
    "id_description"        SERIAL  NOT NULL,
    "id_timeslot_hide_rule" SERIAL  NOT NULL,
    "name"                  TEXT    NOT NULL,
    "allow_gaps"            BOOLEAN NOT NULL,
    "timeslot_mins"         INT     NOT NULL,
    "price_for_timeslot"    INT     NOT NULL,
    PRIMARY KEY ("id_tutoring"),
    FOREIGN KEY ("id_teacher") REFERENCES user ("id_user"),
    FOREIGN KEY ("id_tutoring_scope") REFERENCES tutoringscope ("id_tutoring_scope"),
    FOREIGN KEY ("id_subject") REFERENCES subject ("id_subject"),
    FOREIGN KEY ("id_book") REFERENCES book ("id_book"),
    FOREIGN KEY ("id_description") REFERENCES description ("id_description"),
    FOREIGN KEY ("id_timeslot_hide_rule") REFERENCES timeslothiderule ("id_timeslot_hide_rule")
);

CREATE TABLE "TutoringParticipant_Attribute"
(
    "id_tutoring_participant_attribute" SERIAL NOT NULL,
    "id_tutoring_participant"           SERIAL NOT NULL,
    "id_attribute"                      SERIAL NOT NULL,
    "value"                             TEXT   NOT NULL,
    PRIMARY KEY ("id_tutoring_participant_attribute"),
    FOREIGN KEY ("id_tutoring_participant") REFERENCES tutoringparticipant ("id_tutoring_participant"),
    FOREIGN KEY ("id_attribute") REFERENCES attribute ("id_attribute")
);

CREATE TABLE "AvailableHours"
(
    "id_available_hours" SERIAL NOT NULL,
    "id_tutoring"        SERIAL NOT NULL,
    "weekday"            INT    NOT NULL,
    "start_hour"         TIME   NOT NULL,
    "end_hour"           TIME   NOT NULL,
    PRIMARY KEY ("id_available_hours"),
    FOREIGN KEY ("id_tutoring") REFERENCES tutoring ("id_tutoring")
);