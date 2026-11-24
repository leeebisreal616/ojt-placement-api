import { Injectable, NotFoundException, ConflictException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, In } from 'typeorm';
import { Placement } from './placement.entity';
import { CreatePlacementDto } from './dto/create-placement.dto';
import { UpdatePlacementDto } from './dto/update-placement.dto';

@Injectable()
export class PlacementsService {
  constructor(
    @InjectRepository(Placement)
    private placementsRepository: Repository<Placement>,
  ) {}

  async create(createPlacementDto: CreatePlacementDto, studentId: number) {
    const existingActive = await this.placementsRepository.findOne({
      where: {
        studentId,
        status: In(['pending', 'approved']),
      },
    });

    if (existingActive) {
      throw new ConflictException(
        'You already have an active placement application. Complete or cancel it before applying to a new one.',
      );
    }

    const placement = this.placementsRepository.create({
      ...createPlacementDto,
      studentId,
    });

    return this.placementsRepository.save(placement);
  }

  findAll(): Promise<Placement[]> {
    return this.placementsRepository.find({
      relations: { student: true },
      select: {
        id: true,
        studentId: true,
        companyName: true,
        position: true,
        status: true,
        startDate: true,
        endDate: true,
        student: {
          id: true,
          email: true,
          fullName: true,
          role: true,
        },
      },
    });
  }

  async findOne(id: number): Promise<Placement> {
    const placement = await this.placementsRepository.findOne({
      where: { id },
      relations: { student: true },
      select: {
        id: true,
        studentId: true,
        companyName: true,
        position: true,
        status: true,
        startDate: true,
        endDate: true,
        student: {
          id: true,
          email: true,
          fullName: true,
          role: true,
        },
      },
    });

    if (!placement) throw new NotFoundException('Placement not found');
    return placement;
  }

  async update(id: number, dto: UpdatePlacementDto): Promise<Placement> {
    const placement = await this.findOne(id);
    Object.assign(placement, dto);
    return this.placementsRepository.save(placement);
  }

  async remove(id: number): Promise<void> {
    const placement = await this.findOne(id);
    await this.placementsRepository.remove(placement);
  }

  findByStudent(studentId: number): Promise<Placement[]> {
    return this.placementsRepository.find({
      where: { studentId },
      relations: { student: true },
      select: {
        id: true,
        studentId: true,
        companyName: true,
        position: true,
        status: true,
        startDate: true,
        endDate: true,
        student: {
          id: true,
          email: true,
          fullName: true,
          role: true,
        },
      },
    });
  }
}