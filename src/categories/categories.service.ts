import { Injectable } from '@nestjs/common';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { PrismaService } from '../prisma/prisma.service';
import { Category } from '@prisma/client';

@Injectable()
export class CategoriesService {

  constructor(private prisma: PrismaService) {}
  
  async findAll():Promise<Category[]> {
    return this.prisma.category.findMany();
  }

  findOne(id: string) {
    return this.prisma.category.findUnique({
      where:{id}
    });
  }

  async create(createCategoryDto: CreateCategoryDto):Promise<Category> {
    return this.prisma.category.create({
      data:createCategoryDto
    });
  }
  async update(id: string, updateCategoryDto: UpdateCategoryDto):Promise<Category> {
    return this.prisma.category.update({
      where:{id},
      data:updateCategoryDto
    });
  }

  remove(id: string) {
    return this.prisma.category.delete({
      where:{id}
    });
  }
}
