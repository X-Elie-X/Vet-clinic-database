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
  PRIMARY KEY ("id"),
  FOREIGN KEY (medical_history__id) REFERENCES medical_histories(id)
);
CREATE INDEX index_invoices ON invoices(medical_history__id);

CREATE TABLE "medical_histories" (
  "id" INT,
  "admitted_at" TIMESTAMP,
  "patient_id" INT,
  "status" VARCHAR,
  PRIMARY KEY ("id"),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);
CREATE INDEX index_medical_histories ON medical_histories(patient_id);
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
  PRIMARY KEY ("id"),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id),
  FOREIGN KEY (invoice_id) REFERENCES invoices(id)
);
CREATE INDEX index_treatment_id ON invoice_items(treatment_id);
CREATE INDEX index_invoice_items ON invoice_items(invoice_id);