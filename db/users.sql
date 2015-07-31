PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "avatar" varchar, "role" integer, "password_digest" varchar, "remember_digest" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "users" VALUES(1,'Trinh Duc Duy','trinh.duc.duy@framgia.com',NULL,1,'$2a$10$O7nzZwGlsrdDhIzbWoRh5OVvZCi7sc9MHzK.GEmLUU3yEPgl1pqeS',NULL,'2015-07-31 05:42:52.524483','2015-07-31 05:42:52.524483');
INSERT INTO "users" VALUES(2,'Nguyen Ngoc Trung','nguyen.ngoc.trung@framgia.com',NULL,1,'$2a$10$AroNoxrbC0gaasiDJKcrdeM6Qghxa6hQSO/.zk8.rfZgLXfTHBTp6',NULL,'2015-07-31 05:42:52.738300','2015-07-31 05:42:52.738300');
INSERT INTO "users" VALUES(3,'Superman','superman@gmail.com',NULL,0,'$2a$10$ZbwqBHpsBqQhz5IrQLa3KulnpPaTy5knh6ass434oJk8pAJaU2b4C',NULL,'2015-07-31 05:43:55.531871','2015-07-31 06:56:05.277582');
CREATE INDEX "index_users_on_role" ON "users" ("role");
COMMIT;
