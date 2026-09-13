import { Test, TestingModule } from '@nestjs/testing';
import { LogbookController } from './logbook.controller';

describe('LogbookController', () => {
  let controller: LogbookController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [LogbookController],
    }).compile();

    controller = module.get<LogbookController>(LogbookController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
