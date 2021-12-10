-- DELETE FROM "Bill";
-- DELETE FROM "User";
-- DELETE FROM "RatingDispute";
-- DELETE FROM "TutoringParticipant_WorkingMethod";
-- DELETE FROM "Role";
-- DELETE FROM "TimeslotHideRule";
-- DELETE FROM "Subject";
-- DELETE FROM "SchoolType";
-- DELETE FROM "Medium";
-- DELETE FROM "PaymentMethod";
-- DELETE FROM "TutoringParticipant";
-- DELETE FROM "DiscountRule";
-- DELETE FROM "Timeslot";
-- DELETE FROM "Rating";
-- DELETE FROM "Description";
-- DELETE FROM "GradeLevel";
-- DELETE FROM "Contact";
-- DELETE FROM "TutoringScope";
-- DELETE FROM "Book";
-- DELETE FROM "SpecialNeed";
-- DELETE FROM "Discount";
-- DELETE FROM "WorkingMethod";
-- DELETE FROM "Timeslot_TutoringParticipant";
-- DELETE FROM "User_SpecialNeed";
-- DELETE FROM "Cancellation";
-- DELETE FROM "Attribute";
-- DELETE FROM "TeachingNote";
-- DELETE FROM "Tutoring";
-- DELETE FROM "TutoringParticipant_Attribute";
-- DELETE FROM "AvailableHours";

-- system-related data
INSERT INTO "Role" (id_role, code, name)
VALUES (1, 'participant', 'Participant');
INSERT INTO "Role" (id_role, code, name)
VALUES (2, 'tutor', 'Tutor');

-- domain-related data
INSERT INTO "SchoolType" (id_school_type, name)
VALUES (1, 'Primary School');
INSERT INTO "SchoolType" (id_school_type, name)
VALUES (2, 'High School');
INSERT INTO "SchoolType" (id_school_type, name)
VALUES (3, 'Technical School');
INSERT INTO "SchoolType" (id_school_type, name)
VALUES (4, 'Vocational School');
INSERT INTO "SchoolType" (id_school_type, name)
VALUES (5, 'Special School');

INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (1, 1, 1);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (2, 1, 2);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (3, 1, 3);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (4, 1, 4);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (5, 1, 5);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (6, 1, 6);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (7, 1, 7);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (8, 1, 8);

INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (9, 2, 1);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (10, 2, 2);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (11, 2, 3);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (12, 2, 4);

INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (13, 3, 1);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (14, 3, 2);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (15, 3, 3);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (16, 3, 4);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (17, 3, 5);

INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (18, 4, 1);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (19, 4, 2);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (20, 4, 3);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (21, 4, 4);
INSERT INTO "GradeLevel" (id_grade_level, id_school_type, grade_number)
VALUES (22, 4, 5);

INSERT INTO "Subject" (id_subject, name)
VALUES (1, 'Mathematics');
INSERT INTO "Subject" (id_subject, name)
VALUES (2, 'Physics');
INSERT INTO "Subject" (id_subject, name)
VALUES (3, 'Chemistry');

INSERT INTO "Book" (id_book, name, author)
VALUES (1, 'Matematyka 1', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (2, 'Matematyka 2', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (3, 'Matematyka 3', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (4, 'Matematyka 4', 'Nowsza Era');

INSERT INTO "Book" (id_book, name, author)
VALUES (5, 'Fizyka 1', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (6, 'Fizyka 2', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (7, 'Fizyka 3', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (8, 'Fizyka 4', 'Nowsza Era');

INSERT INTO "Book" (id_book, name, author)
VALUES (9, 'Chemia 1', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (10, 'Chemia 2', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (11, 'Chemia 3', 'Nowsza Era');
INSERT INTO "Book" (id_book, name, author)
VALUES (12, 'Chemia 4', 'Nowsza Era');

INSERT INTO "SpecialNeed" (id_special_need, name)
VALUES (1, 'Dyslexia');
INSERT INTO "SpecialNeed" (id_special_need, name)
VALUES (2, 'Dyscalculia');
INSERT INTO "SpecialNeed" (id_special_need, name)
VALUES (3, 'Dysgraphia');

INSERT INTO "TutoringScope" (id_tutoring_scope, name)
VALUES (1, 'Equalizing classes');
INSERT INTO "TutoringScope" (id_tutoring_scope, name)
VALUES (2, 'Olympiad preparation');
INSERT INTO "TutoringScope" (id_tutoring_scope, name)
VALUES (3, 'Along school program');
INSERT INTO "TutoringScope" (id_tutoring_scope, name)
VALUES (4, 'Ahead of school program');

INSERT INTO "DiscountRule" (id_discount_rule, code, name)
VALUES (1, 'ADJACENT_TO_FREE_SLOTS', 'Adjacent to free slots');
INSERT INTO "DiscountRule" (id_discount_rule, code, name)
VALUES (2, 'ALL_SLOTS', 'All free slots');

INSERT INTO "WorkingMethod" (id_working_method, description)
VALUES (1, 'Kahoutett quiz #1');
INSERT INTO "WorkingMethod" (id_working_method, description)
VALUES (2, 'Kahoutett quiz #2');

-- fake data

-- a teacher and her tutoring
INSERT INTO "Contact" (id_contact, email, phone_number, parent_email, parent_phone_number, description)
VALUES (1, 'teacher@tutors.com', '+48976925152', NULL, NULL, NULL);

INSERT INTO "User" (id_user, id_role, id_grade_level, id_contact, first_name, last_name, date_of_birth)
VALUES (1, 2, NULL, 1, 'Anna', 'Kowalsky', datetime('2000-11-10'));

INSERT INTO "Description" (id_description, banner_url, description)
VALUES (1, 'https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg', 'Cool tutoring for everyone!');

INSERT INTO "TimeslotHideRule" (id_timeslot_hide_rule, total_income_threshold, taken_slots_ratio_threshold)
VALUES (1, NULL, 0.8);

INSERT INTO "Tutoring" (id_tutoring, id_teacher, id_tutoring_scope, id_subject, id_book, id_description,
                        id_timeslot_hide_rule, name, allow_gaps, timeslot_mins, price_for_timeslot)
VALUES (1, 1, 3, 1, 1, 1, 1, 'Math simply explained!', TRUE, 60, 50);

INSERT INTO "AvailableHours" (id_available_hours, id_tutoring, weekday, start_hour, end_hour)
VALUES (1, 1, 0, 10, 16);
INSERT INTO "AvailableHours" (id_available_hours, id_tutoring, weekday, start_hour, end_hour)
VALUES (2, 1, 0, 11, 15);

INSERT INTO "Medium" (id_medium, name, description, is_remote)
VALUES (1, 'Discurd', 'Link to server: discurd.dg/invite/583621', TRUE);

INSERT INTO "Timeslot" (id_timeslot, id_tutoring, id_medium, takes_place_at, allow_multiple_participants)
VALUES (1, 1, 1, datetime('2021-11-06 10:00'), FALSE);
INSERT INTO "Timeslot" (id_timeslot, id_tutoring, id_medium, takes_place_at, allow_multiple_participants)
VALUES (2, 1, 1, datetime('2021-11-06 11:00'), FALSE);
INSERT INTO "Timeslot" (id_timeslot, id_tutoring, id_medium, takes_place_at, allow_multiple_participants)
VALUES (3, 1, 1, datetime('2021-11-06 12:00'), FALSE);
INSERT INTO "Timeslot" (id_timeslot, id_tutoring, id_medium, takes_place_at, allow_multiple_participants)
VALUES (4, 1, 1, datetime('2021-11-07 11:00'), FALSE);
INSERT INTO "Timeslot" (id_timeslot, id_tutoring, id_medium, takes_place_at, allow_multiple_participants)
VALUES (5, 1, 1, datetime('2021-11-07 12:00'), FALSE);

INSERT INTO "Discount" (id_discount, id_tutoring, id_discount_rule, new_price_multiplier,
                        due_date, consumed_count, max_consumed_count)
VALUES (1, 1, 1, 0.8, datetime('2021-12-31 23:59'), 0, NULL);

INSERT INTO "PaymentMethod" (id_payment_method, name, description)
VALUES (1, 'Bank transfer', 'Title: \"Math simply explained!\", account number: US57955545888137044630272802');

INSERT INTO "Attribute" (id_attribute, id_author, name)
VALUES (1, 1, 'Logical thinking');
INSERT INTO "Attribute" (id_attribute, id_author, name)
VALUES (2, 1, 'Understanding story-based tasks');

-- a student that joined the above tutoring
INSERT INTO "Contact" (id_contact, email, phone_number, parent_email, parent_phone_number, description)
VALUES (2, 'jack@black.com', '+48976925152', 'vitaly@black.com', '+485729638145', NULL);

INSERT INTO "User" (id_user, id_role, id_grade_level, id_contact, first_name, last_name, date_of_birth)
VALUES (2, 2, 6, 2, 'Jack', 'Black', datetime('2008-05-01'));

INSERT INTO "User_SpecialNeed" (id_user_special_need, id_user, id_special_need)
VALUES (1, 2, 1);

INSERT INTO "TutoringParticipant" (id_tutoring_participant, id_user)
VALUES (1, 2);

INSERT INTO "Bill" (id_bill, id_payment_method, billed_at, price, payment_confirmed)
VALUES (1, 1, datetime('2021-11-02 15:22:18'), 50, TRUE);

INSERT INTO "Timeslot_TutoringParticipant" (id_timeslot_tutoring_participant, id_timeslot,
                                            id_tutoring_participant, id_bill)
VALUES (1, 3, 1, 1);
INSERT INTO "Timeslot_TutoringParticipant" (id_timeslot_tutoring_participant, id_timeslot,
                                            id_tutoring_participant, id_bill)
VALUES (2, 5, 1, 2);

INSERT INTO "TutoringParticipant_WorkingMethod" (id_tutoring_participant_working_method, id_tutoring_participant,
                                                 id_working_method, completed)
VALUES (1, 1, 1, TRUE);
INSERT INTO "TutoringParticipant_WorkingMethod" (id_tutoring_participant_working_method, id_tutoring_participant,
                                                 id_working_method, completed)
VALUES (2, 1, 2, FALSE);

INSERT INTO "TeachingNote" (id_teaching_note, id_author, id_tutoring_participant, note)
VALUES (1, 1, 1, 'Knows how to use a graphical calculator!');
INSERT INTO "TeachingNote" (id_teaching_note, id_author, id_tutoring_participant, note)
VALUES (2, 1, 1, 'Likes trains');

INSERT INTO "TutoringParticipant_Attribute" (id_tutoring_participant_attribute, id_tutoring_participant,
                                             id_attribute, value)
VALUES (1, 1, 1, '9');
INSERT INTO "TutoringParticipant_Attribute" (id_tutoring_participant_attribute, id_tutoring_participant,
                                             id_attribute, value)
VALUES (2, 1, 1, '7');

INSERT INTO "Rating" (id_rating, id_tutoring, rate, comment)
VALUES (1, 1, 10, 'Best teacher I have ever had!');

INSERT INTO "RatingDispute" (id_rating_dispute, id_rating, id_author, reason, is_reviewed)
VALUES (1, 1, 1, 'Great to hear! :)', TRUE);

INSERT INTO "Cancellation" (id_cancellation, id_timeslot_tutoring_participant, approved)
VALUES (1, 2, TRUE);