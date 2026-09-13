import { Controller, Get, Post, Patch, Delete, Body, Param, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { PlacementsService } from './placements.service';
import { CreatePlacementDto } from './dto/create-placement.dto';
import { UpdatePlacementDto } from './dto/update-placement.dto';

@Controller('placements')
export class PlacementsController {
  constructor(private readonly placementsService: PlacementsService) {}

  @Post()
  create(@Body() dto: CreatePlacementDto) {
    return this.placementsService.create(dto);
  }

  @Get()
  findAll() {
    return this.placementsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.placementsService.findOne(+id);
  }

  @UseGuards(AuthGuard('jwt'))
  @Patch(':id')
  update(@Param('id') id: string, @Body() dto: UpdatePlacementDto) {
    return this.placementsService.update(+id, dto);
  }

  @UseGuards(AuthGuard('jwt'))
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.placementsService.remove(+id);
  }
}