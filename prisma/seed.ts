import { PrismaClient } from "@prisma/client";

import { links } from "../data/links";
const prisma = new PrismaClient();

async function main() {
  await prisma.user.create({
    data: {
      email: "abed@abed.dk",
      role: "ADMIN",
    },
  });

  await prisma.link.createMany({
    data: links,
  });
}

main()
  .catch((err) => console.error(err))
  .finally(async () => {
    await prisma.$disconnect();
  });
