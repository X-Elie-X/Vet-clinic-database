CREATE TABLE "patients" (
  "id" INT,
  "name" varchar,
  "date_of_birth" Date,
  PRIMARY KEY ("id")
);
CREATE TABLE "invoices" (
  "id" INT,
  "total_amount" DECIMAL,
  "generated_at" TIMESTAMP,
  "payed_at" TIMESTAMP,
  "medical_history__id" INT,
  PRIMARY KEY ("id")
);