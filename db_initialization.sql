-- DROP TABLE "Bill";

-- Time slot participation is paid with a Bill
CREATE TABLE "Bill"
(
    "id_bill"           SERIAL   NOT NULL,
    "id_payment_method" SERIAL   NOT NULL,
    "billed_at"         DATETIME NOT NULL,
    "price"             DECIMAL  NOT NULL,
    "payment_confirmed" BOOLEAN  NOT NULL, -- if paid with a bank transfer, Tutor has to manually confirm whether money has arrived
    PRIMARY KEY ("id_bill"),
    FOREIGN KEY ("id_payment_method") REFERENCES PaymentMethod("id_payment_method")
);

-- Account of Tutor or Participant
CREATE TABLE "User"
(
    "id_user"        SERIAL NOT NULL,
    "id_role"        SERIAL NOT NULL,
    "id_grade_level" SERIAL,
    "id_contact"     SERIAL NOT NULL, -- contact info
    "first_name"     TEXT   NOT NULL,
    "last_name"      TEXT   NOT NULL,
    "date_of_birth"  DATETIME,
    PRIMARY KEY ("id_user"),
    FOREIGN KEY ("id_role") REFERENCES role ("id_role"),
    FOREIGN KEY ("id_grade_level") REFERENCES gradelevel ("id_grade_level"),
    FOREIGN KEY ("id_contact") REFERENCES contact ("id_contact")
);

-- Ratings on Tutoring can be disputed by Tutors
CREATE TABLE "RatingDispute"
(
    "id_rating_dispute" SERIAL  NOT NULL,
    "id_rating"         SERIAL  NOT NULL,
    "id_author"         SERIAL  NOT NULL,
    "reason"            TEXT    NOT NULL,
    "is_reviewed"       BOOLEAN NOT NULL, -- admin will review, if reviewed then Rating is hidden
    PRIMARY KEY ("id_rating_dispute"),
    FOREIGN KEY ("id_rating") REFERENCES rating ("id_rating"),
    FOREIGN KEY ("id_author") REFERENCES user ("id_user")
);

-- Working method of a participant
CREATE TABLE "TutoringParticipant_WorkingMethod"
(
    "id_tutoring_participant_working_method" SERIAL  NOT NULL,
    "id_tutoring_participant"                SERIAL  NOT NULL,
    "id_working_method"                      SERIAL  NOT NULL,
    "completed"                              BOOLEAN NOT NULL, -- Tutor can mark whether a working method has been completed
    PRIMARY KEY ("id_tutoring_participant_working_method"),
    FOREIGN KEY ("id_tutoring_participant") REFERENCES tutoringparticipant ("id_tutoring_participant"),
    FOREIGN KEY ("id_working_method") REFERENCES workingmethod ("id_working_method")
);

-- User's role
CREATE TABLE "Role"
(
    "id_role" SERIAL NOT NULL,
    "code"    TEXT   NOT NULL,
    "name"    TEXT   NOT NULL,
    PRIMARY KEY ("id_role")
);

-- Available timeslots can be hidden from joining
CREATE TABLE "TimeslotHideRule"
(
    "id_timeslot_hide_rule"       SERIAL NOT NULL,
    "total_income_threshold"      DECIMAL, -- if set, hide any available slots if total income in a month has reached this
    "taken_slots_ratio_threshold" DECIMAL, -- if set, hide any available slots if a ratio of taken slots has reached this
    PRIMARY KEY ("id_timeslot_hide_rule")
);

-- School subject, for example Mathematics
CREATE TABLE "Subject"
(
    "id_subject" SERIAL NOT NULL,
    "name"       TEXT   NOT NULL,
    PRIMARY KEY ("id_subject")
);

-- School type/level, for example Primary School
CREATE TABLE "SchoolType"
(
    "id_school_type" SERIAL NOT NULL,
    "name"           TEXT   NOT NULL,
    PRIMARY KEY ("id_school_type")
);

-- Tutoring medium, it can be "In person", "Discord"
CREATE TABLE "Medium"
(
    "id_medium"   SERIAL NOT NULL,
    "name"        TEXT   NOT NULL,
    "description" TEXT,
    "is_remote"   BOOLEAN,
    PRIMARY KEY ("id_medium")
);

-- Bill can be paid with different payment methods, for example with "Cash" or "Bank transfer"
CREATE TABLE "PaymentMethod"
(
    "id_payment_method" SERIAL NOT NULL,
    "name"              TEXT   NOT NULL,
    "description"       TEXT   NOT NULL, -- holds details about the method, for example the bank account number
    PRIMARY KEY ("id_payment_method")
);

-- User who is attending some Tutoring classes
CREATE TABLE "TutoringParticipant"
(
    "id_tutoring_participant" SERIAL NOT NULL,
    "id_user"                 SERIAL NOT NULL,
    PRIMARY KEY ("id_tutoring_participant"),
    FOREIGN KEY ("id_user") REFERENCES user ("id_user")
);

--
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

-- Description of a Tutoring class visible publicly
CREATE TABLE "Description"
(
    "id_description" SERIAL NOT NULL,
    "banner_url"     TEXT,
    "description"    TEXT,
    PRIMARY KEY ("id_description")
);

-- School grade of the Participant, for example "IV"
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

-- The scope of the classes. For example "Equalizing classes", "Extracurricular classes", "Along with the program"
CREATE TABLE "TutoringScope"
(
    "id_tutoring_scope" SERIAL NOT NULL,
    "name"              TEXT   NOT NULL,
    PRIMARY KEY ("id_tutoring_scope")
);

-- Book that Participant uses in school
CREATE TABLE "Book"
(
    "id_book" SERIAL NOT NULL,
    "name"    TEXT   NOT NULL,
    "author"  TEXT,
    PRIMARY KEY ("id_book")
);

-- Special educational need of a Participant
CREATE TABLE "SpecialNeed"
(
    "id_special_need" SERIAL NOT NULL,
    "name"            TEXT   NOT NULL,
    PRIMARY KEY ("id_special_need")
);

-- describes the discount and when it is available
CREATE TABLE "Discount"
(
    "id_discount"          SERIAL  NOT NULL,
    "id_tutoring"          SERIAL  NOT NULL,
    "id_discount_rule"     SERIAL  NOT NULL,
    "new_price_multiplier" DECIMAL NOT NULL, -- for example 0.5 means a 50% discount
    "due_date"             DATETIME, -- when does the Discount end? if NULL, then never
    "consumed_count"       INT     NOT NULL, -- how many people used this Discount so far
    "max_consumed_count"   INT, -- how many people can use this Discount? if NULL, then unlimited
    PRIMARY KEY ("id_discount"),
    FOREIGN KEY ("id_tutoring") REFERENCES tutoring ("id_tutoring"),
    FOREIGN KEY ("id_discount_rule") REFERENCES discountrule ("id_discount_rule")
);

-- a task for the Participant, for example "Kahoot quiz"
CREATE TABLE "WorkingMethod"
(
    "id_working_method" SERIAL NOT NULL,
    "description"       TEXT   NOT NULL,
    PRIMARY KEY ("id_working_method")
);

-- describes who has joined the timeslot and how was it paid
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

-- Users can specify their special educational needs
CREATE TABLE "User_SpecialNeed"
(
    "id_user_special_need" SERIAL NOT NULL,
    "id_user"              SERIAL NOT NULL,
    "id_special_need"      SERIAL NOT NULL,
    PRIMARY KEY ("id_user_special_need"),
    FOREIGN KEY ("id_user") REFERENCES user ("id_user"),
    FOREIGN KEY ("id_special_need") REFERENCES specialneed ("id_special_need")
);

-- Participants can cancel a Time Slot participation and free them up for others
CREATE TABLE "Cancellation"
(
    "id_cancellation"                  SERIAL  NOT NULL,
    "id_timeslot_tutoring_participant" SERIAL  NOT NULL,
    "approved"                         BOOLEAN NOT NULL, -- Tutor has to approve the cancellation
    PRIMARY KEY ("id_cancellation"),
    FOREIGN KEY ("id_timeslot_tutoring_participant") REFERENCES timeslot_tutoringparticipant ("id_timeslot_tutoring_participant")
);

-- Tutors can describe for example "Analytical skills" of a Participant
CREATE TABLE "Attribute"
(
    "id_attribute" SERIAL NOT NULL,
    "id_author"    SERIAL NOT NULL, -- author user
    "name"         TEXT   NOT NULL,
    PRIMARY KEY ("id_attribute"),
    FOREIGN KEY ("id_author") REFERENCES user ("id_user")
);

-- Tutor can put a note on a Participant
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

-- Holds information about Tutoring classes
CREATE TABLE "Tutoring"
(
    "id_tutoring"           SERIAL  NOT NULL,
    "id_teacher"            SERIAL  NOT NULL,
    "id_tutoring_scope"     SERIAL  NOT NULL,
    "id_subject"            SERIAL  NOT NULL,
    "id_book"               SERIAL,
    "id_description"        SERIAL  NOT NULL,
    "id_timeslot_hide_rule" SERIAL  NOT NULL,
    "name"                  TEXT    NOT NULL, -- name of the classes
    "allow_gaps"            BOOLEAN NOT NULL, -- allow time windows between tutorings?
    "timeslot_mins"         INT     NOT NULL, -- duration of a time slot in minutes
    "price_for_timeslot"    INT     NOT NULL, -- price per timeslot
    PRIMARY KEY ("id_tutoring"),
    FOREIGN KEY ("id_teacher") REFERENCES user ("id_user"),
    FOREIGN KEY ("id_tutoring_scope") REFERENCES tutoringscope ("id_tutoring_scope"),
    FOREIGN KEY ("id_subject") REFERENCES subject ("id_subject"),
    FOREIGN KEY ("id_book") REFERENCES book ("id_book"),
    FOREIGN KEY ("id_description") REFERENCES description ("id_description"),
    FOREIGN KEY ("id_timeslot_hide_rule") REFERENCES timeslothiderule ("id_timeslot_hide_rule")
);

-- Assignment of an attribute to a participant
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

-- Tutors can specify their available hours, Time Slots will be displayed based on them
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

CREATE INDEX idx_id_payment_method ON PaymentMethod("id_payment_method");
CREATE INDEX idx_id_role ON Role("id_role");
CREATE INDEX idx_id_grade_level ON GradeLevel("id_grade_level");
CREATE INDEX idx_id_contact ON Contact("id_contact");
CREATE INDEX idx_id_rating ON Rating("id_rating");
CREATE INDEX idx_id_user ON User("id_user");
CREATE INDEX idx_id_tutoring_participant ON TutoringParticipant("id_tutoring_participant");
CREATE INDEX idx_id_working_method ON WorkingMethod("id_working_method");
CREATE INDEX idx_id_tutoring ON Tutoring("id_tutoring");
CREATE INDEX idx_id_medium ON Medium("id_medium");
CREATE INDEX idx_id_school_type ON SchoolType("id_school_type");
CREATE INDEX idx_id_discount_rule ON DiscountRule("id_discount_rule");
CREATE INDEX idx_id_timeslot ON Timeslot("id_timeslot");
CREATE INDEX idx_id_bill ON Bill("id_bill");
CREATE INDEX idx_id_special_need ON SpecialNeed("id_special_need");
CREATE INDEX idx_id_timeslot_tutoring_participant ON Timeslot_TutoringParticipant("id_timeslot_tutoring_participant");
CREATE INDEX idx_id_tutoring_scope ON TutoringScope("id_tutoring_scope");
CREATE INDEX idx_id_subject ON Subject("id_subject");
CREATE INDEX idx_id_book ON Book("id_book");
CREATE INDEX idx_id_description ON Description("id_description");
CREATE INDEX idx_id_timeslot_hide_rule ON TimeslotHideRule("id_timeslot_hide_rule");
CREATE INDEX idx_id_attribute ON Attribute("id_attribute");