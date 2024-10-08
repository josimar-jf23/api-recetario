/*
  Warnings:

  - You are about to drop the column `code` on the `units_measure` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "units_measure_code_key";

-- AlterTable
ALTER TABLE "units_measure" DROP COLUMN "code";
