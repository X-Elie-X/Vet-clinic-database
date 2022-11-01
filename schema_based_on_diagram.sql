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

CREATE TABLE "medical_histories" (
  "id" INT,
  "admitted_at" TIMESTAMP,
  "patient_id" INT,
  "status" VARCHAR,
  PRIMARY KEY ("id")
);
CREATE TABLE "treatments" (
  "id" INT,
  "type" VARCHAR,
  "name" VARCHAR,
  PRIMARY KEY ("id")
);
CREATE TABLE "invoice_items" (
  "id" INT,
  "unit_price" DECIMAL,
  "quantity" INT,
  "total_price" DECIMAL,
  "invoice_id" INT,
  "treatment_id" INT,
  PRIMARY KEY ("id")
);