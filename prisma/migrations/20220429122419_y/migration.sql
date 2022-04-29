/*
  Warnings:

  - The primary key for the `Link` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `LinkonUser` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE `LinkonUser` DROP FOREIGN KEY `LinkonUser_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `LinkonUser` DROP FOREIGN KEY `LinkonUser_postId_fkey`;

-- AlterTable
ALTER TABLE `Link` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `LinkonUser` DROP PRIMARY KEY,
    MODIFY `postId` VARCHAR(191) NOT NULL,
    MODIFY `categoryId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`postId`, `categoryId`);

-- AlterTable
ALTER TABLE `User` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `LinkonUser` ADD CONSTRAINT `LinkonUser_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `LinkonUser` ADD CONSTRAINT `LinkonUser_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Link`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
