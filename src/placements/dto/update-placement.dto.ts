import { IsOptional, IsString, IsIn } from 'class-validator';

export class UpdatePlacementDto {
  @IsOptional()
  @IsString()
  companyName?: string;

  @IsOptional()
  @IsString()
  position?: string;

  @IsOptional()
  @IsIn(['pending', 'approved', 'rejected', 'completed'])
  status?: string;

  @IsOptional()
  endDate?: string;
}