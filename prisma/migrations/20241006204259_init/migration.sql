-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "password" TEXT NOT NULL,
    "token" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "units_measure" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "short" VARCHAR(20) NOT NULL,
    "code" TEXT NOT NULL,

    CONSTRAINT "units_measure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "description" TEXT,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "recipes" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(250) NOT NULL,
    "description" TEXT,
    "preparation_time" DECIMAL(9,2) NOT NULL,
    "UserId" TEXT NOT NULL,

    CONSTRAINT "recipes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "recipe_steps" (
    "id" TEXT NOT NULL,
    "step" TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    "RecipeId" TEXT NOT NULL,

    CONSTRAINT "recipe_steps_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "recipe_ingredients" (
    "id" TEXT NOT NULL,
    "ingredient" TEXT NOT NULL,
    "amount" DECIMAL(9,2) NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    "RecipeId" TEXT NOT NULL,

    CONSTRAINT "recipe_ingredients_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "units_measure_name_key" ON "units_measure"("name");

-- CreateIndex
CREATE UNIQUE INDEX "units_measure_code_key" ON "units_measure"("code");

-- CreateIndex
CREATE UNIQUE INDEX "categories_name_key" ON "categories"("name");

-- AddForeignKey
ALTER TABLE "recipes" ADD CONSTRAINT "recipes_UserId_fkey" FOREIGN KEY ("UserId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recipe_steps" ADD CONSTRAINT "recipe_steps_RecipeId_fkey" FOREIGN KEY ("RecipeId") REFERENCES "recipes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "recipe_ingredients" ADD CONSTRAINT "recipe_ingredients_RecipeId_fkey" FOREIGN KEY ("RecipeId") REFERENCES "recipes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
