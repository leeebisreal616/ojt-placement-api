import { Controller, Get, Post, Patch, Delete, Body, Param, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { LogbookService } from './logbook.service';
import { CreateLogbookEntryDto } from './dto/create-logbook-entry.dto';
import { UpdateLogbookEntryDto } from './dto/update-logbook-entry.dto';

@Controller('logbook')
export class LogbookController {
  constructor(private readonly logbookService: LogbookService) {}

  @Post()
  create(@Body() dto: CreateLogbookEntryDto) {
    return this.logbookService.create(dto);
  }

  @Get()
  findAll() {
    return this.logbookService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.logbookService.findOne(+id);
  }

  @Get('placement/:placementId')
  findByPlacement(@Param('placementId') placementId: string) {
    return this.logbookService.findByPlacement(+placementId);
  }

  @UseGuards(AuthGuard('jwt'))
  @Patch(':id')
  update(@Param('id') id: string, @Body() dto: UpdateLogbookEntryDto) {
    return this.logbookService.update(+id, dto);
  }

  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.logbookService.remove(+id);
  }
}