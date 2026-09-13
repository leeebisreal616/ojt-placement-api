import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { LogbookEntry } from './logbook-entry.entity';
import { CreateLogbookEntryDto } from './dto/create-logbook-entry.dto';
import { UpdateLogbookEntryDto } from './dto/update-logbook-entry.dto';

@Injectable()
export class LogbookService {
  constructor(
    @InjectRepository(LogbookEntry)
    private logbookRepository: Repository<LogbookEntry>,
  ) {}

  create(dto: CreateLogbookEntryDto): Promise<LogbookEntry> {
    const entry = this.logbookRepository.create(dto);
    return this.logbookRepository.save(entry);
  }

  findAll(): Promise<LogbookEntry[]> {
    return this.logbookRepository.find({ relations: { placement: true } });
  }

  async findOne(id: number): Promise<LogbookEntry> {
    const entry = await this.logbookRepository.findOne({
      where: { id },
      relations: { placement: true },
    });
    if (!entry) throw new NotFoundException('Logbook entry not found');
    return entry;
  }

  findByPlacement(placementId: number): Promise<LogbookEntry[]> {
    return this.logbookRepository.find({ where: { placementId } });
  }

  async update(id: number, dto: UpdateLogbookEntryDto): Promise<LogbookEntry> {
    const entry = await this.findOne(id);
    Object.assign(entry, dto);
    return this.logbookRepository.save(entry);
  }

  async remove(id: number): Promise<void> {
    const entry = await this.findOne(id);
    await this.logbookRepository.remove(entry);
  }
}