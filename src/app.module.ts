import { Module } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';
import { CategoriesModule } from './categories/categories.module';

@Module({
  imports: [CategoriesModule],
  controllers: [],
  providers: [PrismaService],
})
export class AppModule {}
